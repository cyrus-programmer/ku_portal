import 'package:flutter/material.dart';

import '../utils/AppConstants.dart';

class TextFieldAdminWigt extends StatefulWidget {
  TextEditingController controller;
  String text;
  int lines;
  TextFieldAdminWigt(
      {Key? key, required this.controller, required this.text, this.lines = 1})
      : super(key: key);

  @override
  _TextFieldAdminWigtState createState() => _TextFieldAdminWigtState();
}

class _TextFieldAdminWigtState extends State<TextFieldAdminWigt> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.lines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppConstants.primaryColor)),
        hintText: widget.text,
        labelText: widget.text,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(color: AppConstants.primaryColor),
        hoverColor: AppConstants.primaryColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppConstants.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppConstants.primaryColor)),
      ),
      controller: widget.controller,
    );
  }
}
