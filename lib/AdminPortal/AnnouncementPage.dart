import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/Widgets/TextFieldAdminWigt.dart';
import 'package:ku_portal/Widgets/button.dart';

import '../Widgets/ActivityCard.dart';
import '../utils/AppConstants.dart';

List<String> list = ["Add to", "Scholarships", "Activities"];

class AddAnnouncement extends StatefulWidget {
  AddAnnouncement({Key? key}) : super(key: key);

  @override
  State<AddAnnouncement> createState() => _AddAnnouncementState();
}

class _AddAnnouncementState extends State<AddAnnouncement> {
  var dropdownValue = list.first;
  bool isScholar = true;
  bool isActivity = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController chargesController = TextEditingController();
  TextEditingController semController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  void toggleChange() {
    setState(() {
      isScholar = !isScholar;
      isActivity = !isActivity;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: size.height / 10,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/ku.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      AppConstants.primaryColor.withOpacity(0.8),
                      BlendMode.darken))),
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  "Make an announcement",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Column(children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        toggleChange();
                      },
                      child: Text(
                        "Add Scholarship",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isScholar
                                ? AppConstants.primaryColor
                                : Colors.grey),
                      )),
                  const SizedBox(width: 20),
                  GestureDetector(
                      onTap: () {
                        toggleChange();
                      },
                      child: Text(
                        "Add Activity",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isActivity
                                ? AppConstants.primaryColor
                                : Colors.grey),
                      )),
                ],
              ),
            ),
            isScholar
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            "Scholarship Details",
                            style: TextStyle(
                                color: AppConstants.primaryColor, fontSize: 24),
                          ),
                          SizedBox(height: 15),
                          TextFieldAdminWigt(
                              controller: nameController,
                              text: "Scholarship Name"),
                          SizedBox(height: 15),
                          TextFieldAdminWigt(
                              controller: deptController,
                              text: "Department Name"),
                          SizedBox(height: 15),
                          TextFieldAdminWigt(
                              controller: semController, text: "Semester"),
                          SizedBox(height: 15),
                          TextFieldAdminWigt(
                              controller: chargesController, text: "Charges"),
                          SizedBox(height: 15),
                          TextFieldAdminWigt(
                              controller: urlController, text: "Post URL"),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: (() {}),
                            child: ButtonWidget(
                                width: 160,
                                backgroundColor: AppConstants.primaryColor,
                                text: "Add Scholarship",
                                textColor: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            "Activity Details",
                            style: TextStyle(
                                color: AppConstants.primaryColor, fontSize: 24),
                          ),
                          SizedBox(height: 15),
                          TextFieldAdminWigt(
                              controller: nameController,
                              text: "Activity Name"),
                          SizedBox(height: 15),
                          TextFieldAdminWigt(
                              controller: deptController,
                              text: "Department Name"),
                          SizedBox(height: 15),
                          TextFieldAdminWigt(
                              controller: semController, text: "Timing"),
                          SizedBox(height: 15),
                          TextFieldAdminWigt(
                              controller: chargesController, text: "Charges"),
                          SizedBox(height: 15),
                          TextFieldAdminWigt(
                              controller: urlController, text: "Post URL"),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: (() {}),
                            child: ButtonWidget(
                                width: 160,
                                backgroundColor: AppConstants.primaryColor,
                                text: "Add Activity",
                                textColor: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
            // We have wrote this code for additional functionality that is not required yet.

            // Container(
            //   child: SingleChildScrollView(
            //     child: Padding(
            //       padding: const EdgeInsets.only(left: 5.0, top: 10),
            //       child: Column(
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             // ignore: prefer_const_literals_to_create_immutables
            //             children: [
            //               GestureDetector(
            //                   onTap: () {
            //                     toggleChange();
            //                   },
            //                   child: Text(
            //                     "Current Post",
            //                     style: TextStyle(
            //                         fontSize: 16,
            //                         fontWeight: FontWeight.bold,
            //                         color: isGeneral
            //                             ? AppConstants.primaryColor
            //                             : Colors.grey),
            //                   )),
            //               const SizedBox(width: 10),
            //               GestureDetector(
            //                   onTap: () {
            //                     toggleChange();
            //                   },
            //                   child: Text("See older posts",
            //                       style: TextStyle(
            //                         fontSize: 16,
            //                         fontWeight: FontWeight.bold,
            //                         color: isContact
            //                             ? AppConstants.primaryColor
            //                             : Colors.grey,
            //                       )))
            //             ],
            //           ),
            //           ActivityCard(
            //               buttonText: "Ticket",
            //               activity: "Activity 02",
            //               heading: "KU-Sports Gala",
            //               subHeading: "For all departments",
            //               cost: "Depends on module",
            //               timing: "10:00 - 7:00"),
            //           ActivityCard(
            //               buttonText: "Ticket",
            //               activity: "Activity 02",
            //               heading: "KU-Sports Gala",
            //               subHeading: "For all departments",
            //               cost: "Depends on module",
            //               timing: "10:00 - 7:00"),
            //           ActivityCard(
            //               buttonText: "Ticket",
            //               activity: "Activity 02",
            //               heading: "KU-Sports Gala",
            //               subHeading: "For all departments",
            //               cost: "Depends on module",
            //               timing: "10:00 - 7:00"),
            //           ActivityCard(
            //               buttonText: "Ticket",
            //               activity: "Activity 02",
            //               heading: "KU-Sports Gala",
            //               subHeading: "For all departments",
            //               cost: "Depends on module",
            //               timing: "10:00 - 7:00"),
            //         ],
            //       ),
            //     ),
            //   ),
            // )
          ])),
        ),
      ],
    ));
  }
}
