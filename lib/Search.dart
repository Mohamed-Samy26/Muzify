import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const spotifyapp());
}

class spotifyapp extends StatelessWidget {
  const spotifyapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: searchBar(),
    );
  }
}

class searchBar extends StatefulWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  Widget appbart = Text(
    'Search your song',
  );
  Widget appbart2 = Text('Results');
  Icon actionIcon = Icon(Icons.search);
  var client = http.Client();
  var post;
  @override
  void initState({String txt = 'believe'}) {
    super.initState();
    post = fetchPost(txt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbart,
        backgroundColor: Colors.grey[850],
        actions: <Widget>[
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
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: ('Search......'),
                      hintStyle: TextStyle(color: Colors.white24),
                    ),
                    onChanged: (String txt){
                      print(txt);
                    },
                  );
                } else {
                  actionIcon = const Icon(Icons.search);
                  appbart = const Text('search your song');
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

Future<Post> fetchPost(String txt) async {
  final response = await http.get(Uri(
      scheme: "http",
      host: "ws.audioscrobbler.com",
      path: "/2.0/",
      queryParameters: {
        'method': 'album.search',
        'album': txt,
        'api_key': 'e91c7b033947f23ba64c4aaf1f43f92a',
        'format': 'json'
      }));

  if (response.statusCode == 200) {
    // If the call to the server was successful (returns OK), parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful (response was unexpected), it throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String description;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.description});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      description: json[' description'],
    );
  }
}
