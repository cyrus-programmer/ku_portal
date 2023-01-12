import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Widgets/ActivityCard.dart';
import '../utils/AppConstants.dart';

class ScholarshipPage extends StatefulWidget {
  const ScholarshipPage({Key? key}) : super(key: key);

  @override
  _ScholarshipPageState createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
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
                      "Scholarships",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            ActivityCard(
                buttonText: "Apply",
                activity: "Scholarship 01",
                heading: "HEC-Scholarship Phase-I",
                subHeading: "Science Departments",
                cost: "05 K",
                timing: "8 Semesters"),
            ActivityCard(
                buttonText: "Apply",
                activity: "Scholarship 02",
                heading: "PIAIC-Scholarship Phase-I",
                subHeading: "Science Departments",
                cost: "02 K",
                timing: "4 Semesters"),
            ActivityCard(
                buttonText: "Apply",
                activity: "Scholarship 03",
                heading: "HEC-Scholarship Phase-II",
                subHeading: "For DCS-UBIT students",
                cost: "Depends upon category",
                timing: "7:30 - 11:30"),
            ActivityCard(
              activity: "Scholarship 04",
              heading: "PIAIC-Scholarship Phase-II",
              subHeading: "For all departments",
              cost: "Free",
              timing: "10:00-11:00",
              buttonText: "Apply",
            ),
          ],
        ),
      ),
    );
  }
}
