import 'package:flutter/material.dart';
import '../Classes/Constants.dart';
import '../Classes/NavigationDrawer.dart';

void main() => runApp(MaterialApp(
      home: CreatePlaylist(),
    ));

class CreatePlaylist extends StatefulWidget {
  const CreatePlaylist({Key? key}) : super(key: key);

  @override
  _CreatePlaylistState createState() => _CreatePlaylistState();
}

class _CreatePlaylistState extends State<CreatePlaylist> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 70,
        title: Image(
          image: AssetImage('assets/muzify.png'),
          width: 150,
        ),
      ),
      body:Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                'Create playlist',
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
