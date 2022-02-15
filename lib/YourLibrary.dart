import 'package:flutter/material.dart';
import './NavigationDrawer.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

void main() => runApp(MaterialApp(
      home: YourLibrary(),
    ));

class YourLibrary extends StatefulWidget {
  const YourLibrary({Key? key}) : super(key: key);

  @override
  _YourLibraryState createState() => _YourLibraryState();
}

class _YourLibraryState extends State<YourLibrary> {
  Color veryLightPurble = Color(0xff202744);
  Color lightPurble = Color(0xff1b1c3a);
  Color darkPurble = Color(0xff131126);
  Color gray = Color(0xff666583);
  Color blue = Color(0xff3bb5dc);
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
                    songsList.addAll(songs.map((e) => Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.album),
                                title: Text('${e.title}'),
                                subtitle: Text(
                                    'Artist: ${e.artist}, ${e.displayName}'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    child: const Text('Add to favourites'),
                                    onPressed: () {
                                      /* ... */
                                    },
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
                        placeHold = ListView(
                          children: songsList,
                        );
                      }
                    });
                  },
                  child: Text(
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
