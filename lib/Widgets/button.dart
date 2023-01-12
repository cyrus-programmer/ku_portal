import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  const ButtonWidget(
      {Key? key,
      required this.backgroundColor,
      required this.text,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.4,
      height: MediaQuery.of(context).size.height / 14.6,
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
