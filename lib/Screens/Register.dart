import 'package:flutter/material.dart';
import '../Classes/Constants.dart';
import '../Classes/LocalDatabase.dart';
import 'HomePage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordConfirmationController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool _isTaken = false;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.7,
                      height: size.height * 0.32,
                      child: Image.asset('assets/muzify.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: emailController,
                        autofocus: true,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.person,
                              size: 30, color: Colors.deepPurple),
                          hintText: ('User name'),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: passwordController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.lock_open,
                              size: 30, color: Colors.deepPurple),
                          hintText: ('Password'),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: passwordConfirmationController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.lock_open,
                              size: 30, color: Colors.deepPurple),
                          hintText: ('Confirm'),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        obscureText: true,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                        color: kPrimaryColor,
                        onPressed: () {
                          LocalDatabase.creatDatabase();
                          if (passwordController.text ==
                              passwordConfirmationController.text) {
                            LocalDatabase.getData(LocalDatabase.database);
                            for (int i = 0;
                            i < LocalDatabase.data.length;
                            i++) {
                              if (emailController.text ==
                                  LocalDatabase.data[i].email) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title:
                                      const Text('Username is Taken'),
                                      content:
                                      const Text('Try Another one'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Ok'))
                                      ],
                                    ));
                                _isTaken = true;
                                break;
                              }
                              if (!_isTaken) {
                                LocalDatabase.insertDatabase(
                                    emailController.text,
                                    passwordController.text);
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                          'Signed in Successfuly'),
                                      content:
                                      const Text('Enjoy Our App!!'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                        return const HomePage();
                                                      }));
                                            },
                                            child: const Text('Ok'))
                                      ],
                                    ));
                              }
                            }
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Wrong Confirmation'),
                                  content: const Text(
                                      'Please make sure passwords match!'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Ok'))
                                  ],
                                ));
                          }
                        }, //on pressed
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/main_top.png",
                  width: size.width * 0.4,
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/login_bottom.png",
                  width: size.width * 0.5,
                )),
          ],
        ),
      ),
    );
  }
}
