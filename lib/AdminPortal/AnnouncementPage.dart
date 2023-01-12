import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            child: Column(children: [
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
      const SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "Add Create a post...",
                  ),
                  maxLines: 8,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "T",
                      style: TextStyle(color: Colors.grey, fontSize: 24),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo,
                        size: 24,
                        color: Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.paperclip,
                        size: 20,
                        color: Colors.grey,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonWidget(
                backgroundColor: AppConstants.primaryColor,
                text: "Add Post",
                textColor: Colors.white),
            const SizedBox(width: 10),
            Container(
              width: size.width / 2.8,
              height: size.height / 15,
              decoration: BoxDecoration(
                  color: AppConstants.primaryColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    dropdownColor: AppConstants.primaryColor,
                    value: dropdownValue,
                    icon: const FaIcon(
                      FontAwesomeIcons.chevronDown,
                      size: 12,
                      color: Colors.white,
                    ),
                    elevation: 12,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    underline: Container(
                      height: 0,
                      color: AppConstants.primaryColor,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    GestureDetector(
                        onTap: () {
                          toggleChange();
                        },
                        child: Text(
                          "Current Post",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isGeneral
                                  ? AppConstants.primaryColor
                                  : Colors.grey),
                        )),
                    const SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {
                          toggleChange();
                        },
                        child: Text("See older posts",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isContact
                                  ? AppConstants.primaryColor
                                  : Colors.grey,
                            )))
                  ],
                ),
                ActivityCard(
                    buttonText: "Ticket",
                    activity: "Activity 02",
                    heading: "KU-Sports Gala",
                    subHeading: "For all departments",
                    cost: "Depends on module",
                    timing: "10:00 - 7:00"),
                ActivityCard(
                    buttonText: "Ticket",
                    activity: "Activity 02",
                    heading: "KU-Sports Gala",
                    subHeading: "For all departments",
                    cost: "Depends on module",
                    timing: "10:00 - 7:00"),
                ActivityCard(
                    buttonText: "Ticket",
                    activity: "Activity 02",
                    heading: "KU-Sports Gala",
                    subHeading: "For all departments",
                    cost: "Depends on module",
                    timing: "10:00 - 7:00"),
                ActivityCard(
                    buttonText: "Ticket",
                    activity: "Activity 02",
                    heading: "KU-Sports Gala",
                    subHeading: "For all departments",
                    cost: "Depends on module",
                    timing: "10:00 - 7:00"),
              ],
            ),
          ),
        ),
      )
    ])));
  }
}
