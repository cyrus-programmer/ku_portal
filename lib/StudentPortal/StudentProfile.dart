// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/StudentPortal/NavigatorBar.dart';
import 'package:ku_portal/Widgets/InfoTile.dart';
import 'package:ku_portal/Widgets/TileBox.dart';

import '../utils/AppConstants.dart';
import 'NotificationPage.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  bool isGeneral = true;
  bool isContact = false;
  void toggleChange() {
    setState(() {
      isGeneral = !isGeneral;
      isContact = !isContact;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      AppConstants.primaryColor.withAlpha(230),
                      BlendMode.darken),
                  image: const AssetImage('assets/ku.png'),
                  fit: BoxFit.cover),
              color: AppConstants.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Row(
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
                        const Text(
                          "Student Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "XYZ",
                              style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              "En1000000",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                TileBox(
                  text: "My Profile",
                  width: size.width / 2.5,
                ),
                SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(20)),
                  height: 60,
                  width: size.width / 2.5,
                  // ignore: prefer_const_constructors
                  child: Center(
                    child: const Text(
                      "My Activity",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                GestureDetector(
                    onTap: () {
                      toggleChange();
                    },
                    child: Text(
                      "General",
                      style: TextStyle(
                          fontSize: 16,
                          color: isGeneral
                              ? AppConstants.primaryColor
                              : Colors.grey),
                    )),
                SizedBox(width: 10),
                GestureDetector(
                    onTap: () {
                      toggleChange();
                    },
                    child: Text("Contact Info",
                        style: TextStyle(
                          fontSize: 16,
                          color: isContact
                              ? AppConstants.primaryColor
                              : Colors.grey,
                        )))
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
              child: isGeneral
                  ? Container(
                      child: Column(
                        children: [
                          InfoTile(text: "Years:"),
                          const SizedBox(height: 15),
                          InfoTile(text: "Email address:"),
                          const SizedBox(height: 15),
                          InfoTile(text: "Batch:"),
                          const SizedBox(height: 15),
                          InfoTile(text: "Status:"),
                          const SizedBox(height: 15),
                          InfoTile(text: "Gender:"),
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                        children: [
                          InfoTile(text: "CNIC:"),
                          const SizedBox(height: 15),
                          InfoTile(text: "Email address:"),
                          const SizedBox(height: 15),
                          InfoTile(text: "Permanent address:"),
                          const SizedBox(height: 15),
                          InfoTile(text: "City:"),
                          const SizedBox(height: 15),
                          InfoTile(text: "Phone Number:"),
                        ],
                      ),
                    ))
        ])),
        bottomNavigationBar: NavigatorBottomAppBar(
          page: 'Profile',
        ));
  }
}
