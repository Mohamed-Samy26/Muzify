import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:provider/provider.dart';

class MusicProvider extends ChangeNotifier {
  String path =
      "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3";
  bool isLocal = false;
  List<SongInfo> songs = [];

  setPath(String p) {
    path = p;
    isLocal = true;
    notifyListeners();
  }
}
