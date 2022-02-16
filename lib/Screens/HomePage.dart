import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:m1/Classes/Constants.dart';
import 'package:path/path.dart';
import '../Classes/DurationState.dart';
import '../Classes/NavigationDrawer.dart';
import 'package:provider/provider.dart';
import '../Classes/MusicProvider.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 70,
          title: const Image(
            image: AssetImage('assets/muzify.png'),
            width: 150,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            SizedBox(
              width: 300,
              child: Image.asset('assets/abc.jpg'),
            ),
            const Expanded(child: SizedBox()),
            Container(
              color: KlightPurble,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.stop,
                            size: 40,
                            color: Colors.white,
                          ),
                          onTap: () {
                            audioPlayer.stop();
                            setState(() {});
                          },
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.play_arrow,
                            size: 40,
                            color: Colors.white,
                          ),
                          onTap: () {
                            audioPlayer.play(
                                Provider.of<MusicProvider>(context,
                                        listen: false)
                                    .path,
                                isLocal: Provider.of<MusicProvider>(context,
                                        listen: false)
                                    .isLocal);
                            audioPlayer.onDurationChanged.listen((Duration d) {
                              print('Max duration: $d');
                              setState(() => total = d);
                            });
                            audioPlayer.onAudioPositionChanged
                                .listen((Duration p) {
                              print('Current position: $p');
                              setState(() => progress = p);
                            });
                            DurationState _durationState = DurationState(
                                total: total,
                                progress: progress,
                                buffered: progress);
                            setState(() {});
                          },
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.pause,
                            size: 40,
                            color: Colors.white,
                          ),
                          onTap: () {
                            audioPlayer.pause();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProgressBar(
                        baseBarColor: const Color.fromRGBO(169, 134, 243, 1.0),
                        progressBarColor: Colors.deepPurple,
                        timeLabelTextStyle:
                            const TextStyle(color: Colors.white),
                        thumbColor: Colors.deepPurple,
                        progress: progress,
                        barHeight: 5,
                        total: total,
                        onSeek: (duration) {
                          setState(() {});
                          audioPlayer.seek(duration);
                        }),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
