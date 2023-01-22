import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  double width;
  double height;
  ButtonWidget(
      {Key? key,
      this.height = 50,
      this.width = 120,
      required this.backgroundColor,
      required this.text,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(25)),
      // ignore: prefer_const_constructors
      child: Center(
          // ignore: prefer_const_constructors
          child: Text(
        text,
        // ignore: prefer_const_constructors
        style: TextStyle(
          color: textColor,
          fontSize: 18,
        ),
      )),
    );
  }
}
