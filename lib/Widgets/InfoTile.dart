import 'package:flutter/material.dart';

import '../utils/AppConstants.dart';

class InfoTile extends StatefulWidget {
  String text;
  InfoTile({Key? key, required this.text}) : super(key: key);

  @override
  _InfoTileState createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(color: AppConstants.primaryColor),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15),
        child: Text(
          widget.text,
          style: const TextStyle(color: Colors.grey, fontSize: 18),
        ),
      ),
    );
  }
}
