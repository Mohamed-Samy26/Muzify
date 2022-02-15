import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Classes/NavigationDrawer.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

import '../Classes/Constants.dart';

void main() => runApp(MaterialApp(
  home: YourLibrary(),
));

class YourLibrary extends StatefulWidget {
  const YourLibrary({Key? key}) : super(key: key);

  @override
  _YourLibraryState createState() => _YourLibraryState();
}

class _YourLibraryState extends State<YourLibrary> {

  late List<SongInfo> songs;
  List<Widget> songsList = [Card()];
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  Widget placeHold = Text(
    "No songs yet",
    style: TextStyle(color: Colors.white),
  );
  bool done = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      body: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
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
              SizedBox(
                width: 200,
                child: TextButton(
                  onPressed: () async {
                    songs = await audioQuery.getSongs();
                    songs.forEach((element) {
                      print({'${element} \n'});
                    });
                    songsList.addAll(songs.map((element) => Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                tileColor: Colors.white70,
                                leading: const Icon(
                                  Icons.album,
                                  size: 50,
                                ),
                                title: Text(
                                  element.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                subtitle: Text(
                                    'Artist: ${element.artist}, ${element.displayName}'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.thumb_up),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.play_arrow),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ],
                          ),
                        )));
                    // placeHold =  ListView(
                    //   children: songsList ,
                    // );
                    done = true;
                    setState(() {
                      if (done) {
                        placeHold = SizedBox(
                          height: size.height * 0.6,
                          width: size.width * 0.95,
                          child: ListView(
                            shrinkWrap: done,
                            children: songsList,
                          ),
                        );
                      }
                    });
                  },
                  child: const Text(
                    'Refresh downloaded songs',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurple)),
                ),
              ),
              placeHold
              // ListView(
              //   children: songsList ,
              // )
            ],
          ),
        ],
      ),

    );
  }
}
