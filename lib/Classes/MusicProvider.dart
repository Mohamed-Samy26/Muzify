import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicProvider extends ChangeNotifier {
  String path =
      "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3";
  bool isLocal = false;

  setPath(String p) {
    path = p;
    isLocal = true;
    notifyListeners();
  }
}
