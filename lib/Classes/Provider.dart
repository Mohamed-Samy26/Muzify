import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider extends ChangeNotifier {
  String path = 'no';

  setPath(String p) {
    this.path = p;
    notifyListeners();
  }
}
