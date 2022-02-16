import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'backgroungpogin.dart';

class bodyofloin extends StatelessWidget {
  const bodyofloin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "log in",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        SvgPicture.asset("assets/abc.jpg"),
      ],
    ));
  }
}
