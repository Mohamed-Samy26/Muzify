import 'package:flutter/material.dart';
import '../Screens/login.dart';

import 'Constants.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return background(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to muzify",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.purple)
            ),
            SizedBox(height: 40,),
            Image.asset("assets/muzify.png"),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return loginScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "LOG IN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  color: kPrimaryLightColor,
                  onPressed: () {},
                  child: Text(
                    "REGISTER ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
