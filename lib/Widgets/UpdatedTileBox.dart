import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/DefaultScreens/DepartmentScreen.dart';

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
  ListView listsWidget() {
    return ListView.builder(
      itemCount: widget.departments.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
            title: GestureDetector(
          onTap: () {
            AppConstants.nextScreen(
                context, DepartmentScreen(data: widget.departments[index]));
            print(widget.departments[index]);
          },
          child: Text(
            widget.departments[index]['name'],
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: AppConstants.primaryColor),
          ),
        ));
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
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: ExpansionTile(
            title: Text(widget.text),
            children: <Widget>[Container(height: 200, child: listsWidget())],
          ),
        ),
      ),
    );
  }
}
