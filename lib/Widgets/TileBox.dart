import 'package:flutter/material.dart';

import '../utils/AppConstants.dart';

class TileBox extends StatefulWidget {
  String text;
  double width;
  TileBox({Key? key, required this.text, required this.width})
      : super(key: key);

  @override
  _TileBoxState createState() => _TileBoxState();
}

class _TileBoxState extends State<TileBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppConstants.primaryColor),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      height: 60,
      width: widget.width,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppConstants.primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
