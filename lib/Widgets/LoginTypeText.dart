// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/AppConstants.dart';

class LoginTypeText extends StatefulWidget {
  String text;
  HexColor? textColor = AppConstants.primaryColor;
  LoginTypeText({Key? key, required this.text, this.textColor})
      : super(key: key);

  @override
  State<LoginTypeText> createState() => _LoginTypeTextState();
}

class _LoginTypeTextState extends State<LoginTypeText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          style: TextStyle(color: widget.textColor, fontSize: 24),
        ),
        Text(
          ".",
          style: TextStyle(color: widget.textColor, fontSize: 24),
        )
      ],
    );
  }
}
