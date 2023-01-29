import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Widgets/ActivityCard.dart';
import '../utils/AppConstants.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      "Notifications",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            ActivityCard(
                url: "Apply",
                activity: "Scholarship",
                heading: "HEC-Scholarship Phase-I",
                subHeading: "Science Departments",
                cost: "05 K",
                timing: "8 Semesters"),
            ActivityCard(
                url: "Apply",
                activity: "Scholarship",
                heading: "PIAIC-Scholarship Phase-I",
                subHeading: "Science Departments",
                cost: "02 K",
                timing: "4 Semesters"),
            ActivityCard(
                url: "Ticket",
                activity: "Activity",
                heading: "Annual Dinner",
                subHeading: "For DCS-UBIT students",
                cost: "Depends upon category",
                timing: "7:30 - 11:30"),
            ActivityCard(
                url: "Ticket",
                activity: "Activity",
                heading: "KU-Mega Book fair",
                subHeading: "For all departments",
                cost: "Free",
                timing: "10:00-11:00"),
          ],
        ),
      ),
    );
  }
}
