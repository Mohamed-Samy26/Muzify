import 'package:flutter/material.dart';
import 'package:m1/Classes/Constants.dart';
import 'package:m1/main.dart';

import 'Screens/HomePage.dart';

void main() {
  runApp(Muzify());
}

class Muzify extends StatelessWidget {
  const Muzify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Muzify",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: KdarkPurble),
        scaffoldBackgroundColor: KdarkPurble,
      ),
      home: HomePage(),
    );
  }
}
