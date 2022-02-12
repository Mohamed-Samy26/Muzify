import 'package:flutter/material.dart';
import './NavigationDrawer.dart';

void main() => runApp(MaterialApp(
      home: YourLibrary(),
    ));

class YourLibrary extends StatefulWidget {
  const YourLibrary({Key? key}) : super(key: key);

  @override
  _YourLibraryState createState() => _YourLibraryState();
}

class _YourLibraryState extends State<YourLibrary> {
  Color veryLightPurble =  Color(0xff202744);
  Color lightPurble =  Color(0xff1b1c3a);
  Color darkPurble =  Color(0xff131126);
  Color gray = Color(0xff666583);
  Color blue = Color(0xff3bb5dc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurble,
      endDrawer: NavigationDrawer(),
      body:Column(
        children: <Widget>[
          Builder(builder: (context) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: GestureDetector(
                      child: Icon(
                        Icons.menu,
                        size: 50,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  ),
                  const Image(
                    image: AssetImage('assets/muzify.png'),
                    width: 200,
                  ),
                ],
              ),
            );
          }),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                'Your Library',
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
