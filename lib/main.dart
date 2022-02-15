import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './CreatePlaylist.dart';
import './Hover.dart';
import './LikedSongs.dart';
import './YourLibrary.dart';
import './NavigationDrawer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  AudioPlayer audioPlayer = AudioPlayer();
  Duration total = Duration();
  Duration progress = Duration();
  late DurationState _durationState;
  Color veryLightPurble = Color(0xff202744);
  Color lightPurble = Color(0xff1b1c3a);
  Color darkPurble = Color(0xff131126);
  Color gray = Color(0xff666583);
  Color blue = Color(0xff3bb5dc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurble,
      endDrawer: NavigationDrawer(),
      body: Column(
        children: <Widget>[
          Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Image(
                  image: AssetImage('assets/muzify.png'),
                  width: 200,
                ),
                  Container(
                    child: GestureDetector(
                      child: const Icon(
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
          const Center(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                'Home',
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const SizedBox(
                height: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.play_arrow_outlined),
                      onPressed: () {
                          audioPlayer.play(
                              "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3");
                          audioPlayer.onDurationChanged.listen((Duration d) {
                            print('Max duration: $d');
                            setState(() => total = d);
                          });
                          audioPlayer.onAudioPositionChanged.listen((Duration  p) {
                            print('Current position: $p');
                            setState(() => progress = p);
                          });
                          DurationState _durationState = DurationState(total: total , progress : progress , buffered : progress);
                          setState(() {});
                        }),
                    FloatingActionButton(
                        backgroundColor: Colors.red,
                        child: const Icon(Icons.stop),
                        onPressed: () {
                          audioPlayer.stop();
                          setState(() {});
                        }),
                    FloatingActionButton(
                        backgroundColor: Colors.green,
                        child: const Icon(Icons.pause),
                        onPressed: () {
                          audioPlayer.pause();
                          setState(() {});
                        }),
                  ],
                ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProgressBar(
                        progress: progress,
                        barHeight: 5,
                        total: total,
                        onSeek: (duration) {
                          setState(() {});
                          audioPlayer.seek(duration);
                        }
                    ),
                  )],
          )
        ],
      ),

    );
  }
}


class DurationState {
  const DurationState({required this.progress,  required this.buffered, required this.total});
  final Duration progress;
  final Duration buffered;
  final Duration total;
}
