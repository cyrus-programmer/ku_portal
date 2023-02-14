import 'package:flutter/material.dart';
import 'package:ku_portal/AdminControllers/DepartmentController.dart';
import 'package:ku_portal/DefaultScreens/DepartmentScreen.dart';
import 'package:ku_portal/Models/DepartmentModel.dart';

import '../utils/AppConstants.dart';

class UpdatedTileBox extends StatefulWidget {
  String text;
  double width;
  List<String> departments;
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
  FutureBuilder getDepartents(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DepartmentController.getDepartment(widget.departments),
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasData) {
          List<Map<String, dynamic>>? data = snapshot.data;
          return listsWidget(data!, context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView listsWidget(List<Map<String, dynamic>> data, BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
            title: GestureDetector(
          onTap: () {
            AppConstants.nextScreen(
                context, DepartmentScreen(data: data[index]));
          },
          child: Text(
            data[index]["name"]!,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: const [0.04, 0.04],
                colors: [AppConstants.primaryColor, Colors.white]),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: AppConstants.primaryColor)),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: ExpansionTile(
            title: Text(widget.text),
            children: <Widget>[
              SizedBox(height: 200, child: getDepartents(context))
            ],
          ),
        ),
      ),
    );
  }
}
