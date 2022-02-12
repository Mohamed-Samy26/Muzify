//=================> OLD FILE DON'T USE <===============

// import 'package:audioplayers/audioplayers.dart';
// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:flutter/material.dart';
// // old file
// void main1() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Counter(),
//       color: Colors.greenAccent,
//     );
//   }
// }
//
// class Counter extends StatefulWidget {
//   const Counter({Key? key}) : super(key: key);
//
//   @override
//   _CounterState createState() => _CounterState();
// }
//
// class _CounterState extends State<Counter> {
//
//   AudioPlayer audioPlayer = AudioPlayer();
//   Duration total = Duration();
//   Duration progress = Duration();
//   late DurationState _durationState;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.greenAccent,
//           title: const Text(
//             "Spotifyre",
//           )),
//       body: Center(
//         child: Column(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: const [
//                 Text(
//                   "Music player",
//                   style: TextStyle(fontSize: 50),
//                 ),
//                 SizedBox(height: 500),
//               ],
//             ),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   FloatingActionButton(
//                       backgroundColor: Colors.blue,
//                       child: const Icon(Icons.play_arrow_outlined),
//                       onPressed: () {
//                         audioPlayer.play(
//                             "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3");
//                         audioPlayer.onDurationChanged.listen((Duration d) {
//                           print('Max duration: $d');
//                           setState(() => total = d);
//                         });
//                         audioPlayer.onAudioPositionChanged.listen((Duration  p) {
//                         print('Current position: $p');
//                         setState(() => progress = p);
//                         });
//                         DurationState _durationState = DurationState(total: total , progress : progress , buffered : progress);
//                         setState(() {});
//                       }),
//                   FloatingActionButton(
//                       backgroundColor: Colors.red,
//                       child: const Icon(Icons.stop),
//                       onPressed: () {
//                         audioPlayer.stop();
//                         setState(() {});
//                       }),
//                   FloatingActionButton(
//                       backgroundColor: Colors.green,
//                       child: const Icon(Icons.pause),
//                       onPressed: () {
//                         audioPlayer.pause();
//                         setState(() {});
//                       }),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ProgressBar(
//                   progress: progress,
//                   barHeight: 5,
//                   total: total,
//                   onSeek: (duration) {
//                     setState(() {});
//                     audioPlayer.seek(duration);
//                   }
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DurationState {
//   const DurationState({required this.progress,  required this.buffered, required this.total});
//   final Duration progress;
//   final Duration buffered;
//   final Duration total;
// }