import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Classes/Constants.dart';
import '../Classes/LocalDatabase.dart';
import 'HomePage.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.7,
                  height: size.height * 0.42,
                  child: Image.asset('assets/muzify.png'),
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: emailController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    prefixIcon:
                        Icon(Icons.person, size: 30, color: Colors.deepPurple),
                    hintText: ('User name'),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                TextField(
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
                SizedBox(
                  height: size.height * 0.06,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    color: kPrimaryColor,
                    onPressed: () {
                      LocalDatabase.creatDatabase();
                      LocalDatabase.getData(LocalDatabase.database);
                      for (int i = 0; i < LocalDatabase.data.length; i++) {
                        if (LocalDatabase.data[i].email ==
                            emailController.text) {
                          if (LocalDatabase.data[i].password ==
                              passwordController.text) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                            break;
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Wrong password'),
                                      content: Text('Try Again'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Ok'))
                                      ],
                                    ));
                          }
                        } else {
                          print('2');
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('Invalid User'),
                                    content: Text('not a signed in user'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Ok'))
                                    ],
                                  ));
                        }
                      }
                    }, //on pressed
                    child: const Text(
                      "LOG IN",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
