import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/Widgets/ActivityCard.dart';
import 'package:ku_portal/Widgets/button.dart';
import 'package:ku_portal/utils/AppConstants.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
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
                      "Activities",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            ActivityCard(
                buttonText: "Ticket",
                activity: "Activity 01",
                heading: "KU-Mega Book fair",
                subHeading: "For all departments",
                cost: "Free",
                timing: "10:00-11:00"),
            ActivityCard(
                buttonText: "Ticket",
                activity: "Activity 02",
                heading: "KU-Sports Gala",
                subHeading: "For all departments",
                cost: "Depends on module",
                timing: "10:00 - 7:00"),
            ActivityCard(
                buttonText: "Ticket",
                activity: "Activity 03",
                heading: "Annual Dinner",
                subHeading: "For DCS-UBIT students",
                cost: "Depends upon category",
                timing: "7:30 - 11:30"),
            ActivityCard(
                buttonText: "Ticket",
                activity: "Activity 01",
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
