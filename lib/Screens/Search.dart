import 'package:flutter/material.dart';
import 'package:m1/Classes/Downloader.dart';
import 'package:youtube_api/youtube_api.dart';

import '../Classes/Constants.dart';
import '../Classes/NavigationDrawer.dart';

void main() => runApp(MaterialApp(
      home: Search(),
    ));

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  Widget appbart = const Text(
    'Search for your song',
    style: TextStyle(
      color: Colors.pinkAccent,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );

  Widget appbart2 = Text('Results');
  Icon actionIcon = Icon(
    Icons.search,
    size: 30,
    color: Colors.white,
  );
  var post;

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
      body: Center(
        
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              appbart,
              IconButton(
                icon: actionIcon,
                onPressed: () {
                  setState(() {
                    if (actionIcon.icon == Icons.search) {
                      actionIcon =
                          const Icon(Icons.close, size: 30, color: Colors.white);
                      appbart = TextField(
                        autofocus: true,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon:
                              Icon(Icons.search, size: 30, color: Colors.white),
                          hintText: ('Search...'),
                          hintStyle: TextStyle(color: Colors.white60),
                        ),
                        onSubmitted: (String txt) async {
                          List<YouTubeVideo> video = await Downloader.callAPI(txt);
                          print(video.first.url);
                          try {
                            Downloader.download(video.first.url);
                          } catch (error) {
                            print('Something went wrong');
                          }
                        },
                      );
                    } else {
                      actionIcon = const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      );
                      appbart = const Text(
                        'Search for your song',
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
        ),
      ),
    );
  }
}