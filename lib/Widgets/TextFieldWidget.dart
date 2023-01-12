import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldWidget extends StatefulWidget {
  String hintText;
  bool isIcon;
  FaIcon? suffix = null;
  TextFieldWidget(
      {Key? key, required this.hintText, required this.isIcon, this.suffix})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.isIcon
        ? Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
                decoration: InputDecoration(
              hintText: widget.hintText,
            )),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
                decoration: InputDecoration(
                    hintText: widget.hintText,
                    suffixIcon: IconButton(
                      icon: widget.suffix!,
                      onPressed: () {},
                    ))),
          );
  }
}
