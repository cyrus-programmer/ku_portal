
import 'package:flutter/material.dart';

import '../utils/AppConstants.dart';

class AppBarImage extends StatefulWidget {
  String imagePath;
  double height;
  AppBarImage({Key? key, required this.height, required this.imagePath})
      : super(key: key);

  @override
  State<AppBarImage> createState() => _AppBarImageState();
}

class _AppBarImageState extends State<AppBarImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.imagePath), fit: BoxFit.cover),
            color: AppConstants.primaryColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))));
  }
}
