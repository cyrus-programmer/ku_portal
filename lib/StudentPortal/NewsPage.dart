import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ku_portal/StudentPortal/ActivitiesPage.dart';
import 'package:ku_portal/StudentPortal/DepartmentsPage.dart';
import 'package:ku_portal/StudentPortal/FeedbackPage.dart';
import 'package:ku_portal/StudentPortal/NavigatorBar.dart';
import 'package:ku_portal/StudentPortal/ScholarshipPage.dart';
import 'package:ku_portal/Widgets/NewsCard.dart';

import '../AdminControllers/ActivityController.dart';
import '../AdminControllers/ScholarController.dart';
import '../Models/ActivityModel.dart';
import '../Models/ScholarshipModel.dart';
import '../Widgets/ActivityCard.dart';
import '../utils/AppConstants.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
                    "News Updates",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
              child: Column(children: [
            const SizedBox(height: 60),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (() {
                        AppConstants.nextScreen(context, ActivitiesPage());
                      }),
                      child: NewsCard(
                          heading: "Activities",
                          subHeading: "Events related to\nUniversity",
                          icon: FontAwesomeIcons.circleExclamation),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppConstants.nextScreen(context, DepartmentsPage());
                      },
                      child: NewsCard(
                          heading: "Departments",
                          subHeading: "Info related to\nDepartments",
                          icon: FontAwesomeIcons.building),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppConstants.nextScreen(context, ScholarshipPage());
                      },
                      child: NewsCard(
                          heading: "Scholarships",
                          subHeading: "News related to\nScholarships",
                          icon: FontAwesomeIcons.clipboardList),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppConstants.nextScreen(context, FeedbackPage());
                      },
                      child: NewsCard(
                          heading: "Feedback",
                          subHeading: "Feedback about\nUniversity",
                          icon: FontAwesomeIcons.message),
                    ),
                  ],
                ),
              ],
            )
          ])),
        ],
      ),
      bottomNavigationBar: NavigatorBottomAppBar(
        page: 'News',
      ),
    );
  }
}
