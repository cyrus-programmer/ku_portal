import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/AdminPortal/AboutUs.dart';
import 'package:ku_portal/AdminPortal/AdminFeedback.dart';
import 'package:ku_portal/AdminPortal/AnnouncementPageAD.dart';
import 'package:ku_portal/AdminPortal/DepartmentAD.dart';
import 'package:ku_portal/AdminPortal/NavigatorBarAD.dart';

import '../Widgets/NewsCard.dart';
import '../utils/AppConstants.dart';
import 'AnnouncementPage.dart';

class CMSPage extends StatefulWidget {
  const CMSPage({Key? key}) : super(key: key);

  @override
  State<CMSPage> createState() => _CMSPageState();
}

class _CMSPageState extends State<CMSPage> {
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
                  "Admin Management",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 60),
        Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (() {
                    AppConstants.nextScreen(context, const AboutUs());
                  }),
                  child: NewsCard(
                      heading: "About us",
                      subHeading: "Info related to\nUniversity",
                      icon: FontAwesomeIcons.circleExclamation),
                ),
                GestureDetector(
                  onTap: () {
                    AppConstants.nextScreen(context, const DepartmentsAD());
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
                    AppConstants.nextScreen(context, const AnnouncementPageAD());
                  },
                  child: NewsCard(
                      heading: "News",
                      subHeading: "News related to\nScholarships",
                      icon: FontAwesomeIcons.clipboardList),
                ),
                GestureDetector(
                  onTap: () {
                    AppConstants.nextScreen(context, const FeedBackAD());
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
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
                AppConstants.nextScreen(context, const AddAnnouncement());
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
        page: 'CMS',
      ),
    );
  }
}
