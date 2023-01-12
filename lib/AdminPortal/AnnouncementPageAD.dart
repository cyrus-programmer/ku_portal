import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Widgets/ActivityCard.dart';
import '../utils/AppConstants.dart';
import 'AnnouncementPage.dart';
import 'NavigatorBarAD.dart';

class AnnouncementPageAD extends StatefulWidget {
  const AnnouncementPageAD({Key? key}) : super(key: key);

  @override
  _AnnouncementPageADState createState() => _AnnouncementPageADState();
}

class _AnnouncementPageADState extends State<AnnouncementPageAD> {
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
                      "Anouncements",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            ActivityCard(
                buttonText: "Apply",
                activity: "Scholarship",
                heading: "HEC-Scholarship Phase-I",
                subHeading: "Science Departments",
                cost: "05 K",
                timing: "8 Semesters"),
            ActivityCard(
                buttonText: "Apply",
                activity: "Scholarship",
                heading: "PIAIC-Scholarship Phase-I",
                subHeading: "Science Departments",
                cost: "02 K",
                timing: "4 Semesters"),
            ActivityCard(
                buttonText: "Ticket",
                activity: "Activity",
                heading: "Annual Dinner",
                subHeading: "For DCS-UBIT students",
                cost: "Depends upon category",
                timing: "7:30 - 11:30"),
            ActivityCard(
                buttonText: "Ticket",
                activity: "Activity",
                heading: "KU-Mega Book fair",
                subHeading: "For all departments",
                cost: "Free",
                timing: "10:00-11:00"),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 50,
        width: 50,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: AppConstants.primaryColor, width: 1.0),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0),
              onTap: () {
                AppConstants.nextScreen(context, AddAnnouncement());
              },
              child: Icon(
                Icons.add,
                color: AppConstants.primaryColor,
                size: 24,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigatorBarAD(
        page: 'News',
      ),
    );
  }
}
