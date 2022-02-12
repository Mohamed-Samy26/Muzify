import 'package:flutter/material.dart';
import 'package:m1/Count.dart';
import 'package:provider/provider.dart';
import './Screen2.dart';
void main1 ()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.red,
        home :Screen1());
  }
}
class Screen1 extends StatefulWidget {
  Screen1({Key? key , int c = 0}) : super(key: key);
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int c=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      Provider.of<Count>(context , listen: false).count.toString()
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) { return  Screen2(c: c);}));
                  }, child: Text("Next Page")),
                  TextButton(
                      onPressed: (){
                      Provider.of<Count>(context , listen: false).add();
                  }, child: Text("Add +1 "))
                ],
              )
          )
      ),
    );
  }
}

