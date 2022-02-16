import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
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
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.stop),
                    onPressed: () {
                      audioPlayer.stop();
                      setState(() {});
                    }),
                FloatingActionButton(
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.play_arrow_outlined),
                    onPressed: () {
                      audioPlayer.play(
                          Provider.of<MusicProvider>(context, listen: false)
                              .path,
                          isLocal:
                              Provider.of<MusicProvider>(context, listen: false)
                                  .isLocal);
                      audioPlayer.onDurationChanged.listen((Duration d) {
                        print('Max duration: $d');
                        setState(() => total = d);
                      });
                      audioPlayer.onAudioPositionChanged.listen((Duration p) {
                        print('Current position: $p');
                        setState(() => progress = p);
                      });
                      DurationState _durationState = DurationState(
                          total: total, progress: progress, buffered: progress);
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
                  baseBarColor: const Color.fromRGBO(169, 134, 243, 1.0),
                  progressBarColor: Colors.deepPurple,
                  timeLabelTextStyle: const TextStyle(color: Colors.white),
                  thumbColor: Colors.deepPurple,
                  progress: progress,
                  barHeight: 5,
                  total: total,
                  onSeek: (duration) {
                    setState(() {});
                    audioPlayer.seek(duration);
                  }),
          )],
      )
    );
  }
}
