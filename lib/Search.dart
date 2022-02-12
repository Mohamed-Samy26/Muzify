import 'package:flutter/material.dart';

import './NavigationDrawer.dart';

void main() => runApp(MaterialApp(
      home: Search(),
    ));

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Color veryLightPurble = new Color(0xff202744);
  Color lightPurble = new Color(0xff1b1c3a);
  Color darkPurble = new Color(0xff131126);
  Color gray = new Color(0xff666583);
  Color blue = new Color(0xff3bb5dc);
  Widget appbart = Text(
    'Search your song',
  );
  Widget appbart2 = Text('Results');
  Icon actionIcon = Icon(Icons.search);
  var post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurble,
      endDrawer: NavigationDrawer(),
      body: Column(
        children: <Widget>[
          Builder(builder: (context) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/muzify.png'),
                    width: 200,
                  ),
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
                ],
              ),
            );
          }),
          appbart,
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = const Icon(Icons.close);
                  appbart = TextField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: ('Search...'),
                      hintStyle: TextStyle(color: Colors.white24),
                    ),
                    onChanged: (String txt) {
                      print(txt);
                    },
                  );
                } else {
                  actionIcon = const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  );
                  appbart = const Text(
                    'Search your song',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              });
            },
          )
        ],
      ),
    );
  }
}