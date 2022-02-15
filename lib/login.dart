import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Home.dart';
import './colors.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

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
                const TextField(
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
                const TextField(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    },
                    child: Text(
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
