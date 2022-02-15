import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m1/Home.dart';
import './NavigationDrawer.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import './MusicProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MaterialApp(
      home: YourLibrary(),
    ));

class YourLibrary extends StatefulWidget {
  const YourLibrary({Key? key}) : super(key: key);

  @override
  _YourLibraryState createState() => _YourLibraryState();
}

class _YourLibraryState extends State<YourLibrary> {
  Color veryLightPurble = const Color(0xff202744);
  Color lightPurble = const Color(0xff1b1c3a);
  Color darkPurble = const Color(0xff131126);
  Color gray = const Color(0xff666583);
  Color blue = const Color(0xff3bb5dc);
  late List<SongInfo> songs;
  List<Widget> songsList = [const Card()];
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  Widget placeHold = const Text(
    "No songs yet",
    style: TextStyle(color: Colors.white),
  );
  bool done = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkPurble,
      endDrawer: const NavigationDrawer(),
      body: Column(
        children: <Widget>[
          Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: const Icon(
                      Icons.menu,
                      size: 50,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
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
              const Padding(
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
                    for (var element in songs) {
                      print({'$element \n'});
                    }
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
                                  style: const TextStyle(
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
                                    icon: const Icon(Icons.thumb_up),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.play_arrow),
                                    onPressed: () {
                                      Provider.of<MusicProvider>(context,
                                              listen: false)
                                          .setLocalPath(element.filePath);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => const HomePage(),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ],
                          ),
                        )));
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
            ],
          ),
        ],
      ),

    );
  }
}
