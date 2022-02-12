import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count extends ChangeNotifier{
  int count =0;
  void add(){
    count++;
    notifyListeners();
  }
  void sub(){
    count--;
    notifyListeners();
  }
}