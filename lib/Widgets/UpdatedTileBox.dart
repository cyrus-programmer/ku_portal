import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/AppConstants.dart';

class UpdatedTileBox extends StatefulWidget {
  String text;
  double width;
  List departments;
  UpdatedTileBox(
      {Key? key,
      required this.text,
      required this.width,
      required this.departments})
      : super(key: key);

  @override
  _UpdatedTileBoxState createState() => _UpdatedTileBoxState();
}

class _UpdatedTileBoxState extends State<UpdatedTileBox> {
  List ubitDepartments = [
    "Department of Computer Science",
    "Food and Science Technology Department",
    "Applied Physics Department"
  ];
  ListView listsWidget() {
    return ListView.builder(
      itemCount: ubitDepartments.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(title: Text(ubitDepartments[index]));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: new LinearGradient(
                stops: [0.04, 0.04],
                colors: [AppConstants.primaryColor, Colors.white]),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: AppConstants.primaryColor)),
        child: ExpansionTile(
          title: Text(widget.text),
          children: <Widget>[listsWidget()],
        ),
      ),
    );
  }
}
