import 'package:flutter/material.dart';
import './Screen1.dart';

class Screen2 extends StatefulWidget {
  Screen2({Key? key , required this.c}) : super(key: key);
  int c;
  @override
  _Screen2State createState() => _Screen2State(c : c);
}

class _Screen2State extends State<Screen2> {
  @override
  int c;
  _Screen2State({required this.c});
  Widget build(BuildContext context) {
    return Scaffold(
      body: (
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(c.toString()),
                  TextButton(onPressed: (){
                    Navigator.pop(context, MaterialPageRoute(builder: (_) { return  Screen1(c: c);}));
                  }, child: Text("Previous Page")),
                  TextButton(onPressed: (){
                    setState(() {
                      c++;
                    });
                  }, child: Text("Add +1 "))
                ],
              )
          )
      ),
    );
  }
}