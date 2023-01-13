import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/Widgets/InfoTile.dart';
import 'package:ku_portal/Widgets/TileBox.dart';
import 'package:ku_portal/Widgets/UpdatedTileBox.dart';
import 'package:ku_portal/Widgets/button.dart';

import '../Widgets/AppBarImage.dart';
import '../utils/AppConstants.dart';

class DepartmentsAD extends StatefulWidget {
  const DepartmentsAD({Key? key}) : super(key: key);

  @override
  _DepartmentsADState createState() => _DepartmentsADState();
}

class _DepartmentsADState extends State<DepartmentsAD> {
  List ubitDepartments = [
    "Department of Computer Science",
    "Food and Science Technology Department",
    "Applied Physics Department"
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        height: size.height / 3.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('assets/ubit.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken)),
            color: AppConstants.primaryColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  AppConstants.backScreenReplace(context);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.circleLeft,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Departments",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                    decoration: InputDecoration(
                        isDense: true, // Added this
                        contentPadding: const EdgeInsets.all(8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide:
                                BorderSide(color: AppConstants.primaryColor)),
                        hintText: "Search department",
                        hintStyle: const TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        suffixIcon: const Icon(
                          Icons.filter_list_outlined,
                          color: Colors.grey,
                        ))),
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      Card(
        child: UpdatedTileBox(
          text: "Science Department",
          width: double.maxFinite,
          departments: ubitDepartments,
        ),
      ),
      Card(
        child: UpdatedTileBox(
          text: "Arts Department",
          width: double.maxFinite,
          departments: ubitDepartments,
        ),
      ),
      Card(
        child: UpdatedTileBox(
          text: "Arts Department",
          width: double.maxFinite,
          departments: ubitDepartments,
        ),
      ),
      Card(
        child: UpdatedTileBox(
          text: "Arts Department",
          width: double.maxFinite,
          departments: ubitDepartments,
        ),
      ),
      Card(
        child: UpdatedTileBox(
          text: "Arts Department",
          width: double.maxFinite,
          departments: ubitDepartments,
        ),
      ),
      const SizedBox(height: 10),
      ButtonWidget(
          backgroundColor: AppConstants.primaryColor,
          text: "Edit Info",
          textColor: Colors.white),
    ])));
  }
}