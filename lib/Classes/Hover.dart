import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hover extends StatefulWidget {

  final Widget Function(bool isHovered) builder;

  const Hover({Key? key, required this.builder}) : super(key: key);

  @override
  _HoverState createState() => _HoverState();
}

class _HoverState extends State<Hover> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    //if hovered make container move 5 in x-axis
    //else make container go to his origin position
    final transform = isHovered ? (Matrix4.identity()..translate(5,0,0)) : Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
