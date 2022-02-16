import 'package:flutter/material.dart';
import 'package:m1/Classes/Constants.dart';
import 'package:m1/Classes/MusicProvider.dart';
import 'package:m1/Screens/Welcome.dart';
import 'package:m1/main.dart';
import 'package:provider/provider.dart';

import 'Screens/HomePage.dart';

void main() {
  runApp(Muzify());
}

class Muzify extends StatelessWidget {
  const Muzify({Key? key}) : super(key: key);

//flutter run --no-sound-null-safety

 // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return MusicProvider();
        },
        child: MaterialApp(
          title: "Muzify",
          debugShowCheckedModeBanner: false,
          home: welcome(),
          theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: KdarkPurble),
            scaffoldBackgroundColor: KdarkPurble,
          ),
        ));
  }
}
