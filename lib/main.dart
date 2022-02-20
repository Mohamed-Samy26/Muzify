import 'package:flutter/material.dart';
import 'package:m1/Classes/Constants.dart';
import 'package:m1/Classes/MusicProvider.dart';
import 'package:m1/Screens/Welcome.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Muzify());
}

class Muzify extends StatelessWidget {
  const Muzify({Key? key}) : super(key: key);

//flutter run --no-sound-null-safety
//flutter pub run flutter_native_splash:create
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
          home: const Welcome(),
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: KdarkPurble),
            scaffoldBackgroundColor: KdarkPurble,
          ),
        ));
  }
}
