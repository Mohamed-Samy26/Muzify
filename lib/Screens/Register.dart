import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Classes/Constants.dart';
import '../Classes/LocalDatabase.dart';
import 'HomePage.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

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
                  controller: emailController,
                  autofocus: true,
                  decoration: InputDecoration(
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
                  controller: passwordController,
                  decoration: InputDecoration(
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
                TextField(
                  controller: passwordConfirmationController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.lock_open,
                        size: 30, color: Colors.deepPurple),
                    hintText: ('Confirm'),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  obscureText: true,
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: kPrimaryColor,
                    onPressed: () {
                      LocalDatabase.creatDatabase();
                      if(passwordController.text==passwordConfirmationController.text){
                        LocalDatabase.getData(LocalDatabase.database);
                        for(int i =0;i<LocalDatabase.data.length;i++){
                          if(emailController.text==LocalDatabase.data[i].email){
                            showDialog(context: context, builder: (context) =>AlertDialog(
                              title: Text('Username is Taken'),
                              content: Text('Try Another one'),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.of(context).pop();
                                }, child: Text('Ok'))
                              ],
                            ));
                            _isTaken = true;
                            break;
                          }
                          if(!_isTaken){
                            LocalDatabase.insertDatabase(emailController.text, passwordController.text);
                            showDialog(context: context, builder: (context) =>AlertDialog(
                              title: Text('Signed in Successfuly'),
                              content: Text('Enjoy Our App!!'),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.of(context).pop();
                                  Navigator.push(context,MaterialPageRoute(builder: (context) {return HomePage();}));
                                }, child: Text('Ok'))
                              ],
                            ));
                          }
                        }
                      }else{
                        showDialog(context: context, builder: (context) =>AlertDialog(
                          title: Text('Wrong Confirmation'),
                          content: Text('Please make sure passwords match!'),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();
                            }, child: Text('Ok'))
                          ],
                        ));
                      }
                    },//on pressed
                    child: Text(
                      "Register",
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
