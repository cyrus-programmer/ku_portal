import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class AppConstants {
  static HexColor primaryColor = HexColor('#83000A');
  static void nextScreen(context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void nextScreenReplace(context, page) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static void backScreenReplace(context) {
    Navigator.pop(context);
  }
}
