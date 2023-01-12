import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/AdminPortal/AdminDashboard.dart';
import 'package:ku_portal/AdminPortal/AnnouncementPageAD.dart';
import 'package:ku_portal/AdminPortal/CMSPage.dart';
import 'package:ku_portal/AdminPortal/SettingAD.dart';
import 'package:ku_portal/StudentPortal/NotificationPage.dart';
import 'package:ku_portal/StudentPortal/SettingPage.dart';
import 'package:ku_portal/StudentPortal/StudentDashBoard.dart';
import 'package:ku_portal/StudentPortal/StudentProfile.dart';

import '../StudentPortal/NewsPage.dart';
import '../utils/AppConstants.dart';

// ignore: must_be_immutable
class NavigatorBarAD extends StatelessWidget {
  String page;
  NavigatorBarAD({required this.page});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox.fromSize(
              size: const Size(56, 56),
              child: ClipOval(
                child: Material(
                  child: InkWell(
                    splashColor: AppConstants.primaryColor,
                    onTap: () {
                      AppConstants.nextScreenReplace(context, AdminDashboard());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home_outlined,
                          size: 30,
                          color: page == 'Home'
                              ? AppConstants.primaryColor
                              : Colors.grey,
                        ), // <-- Icon
                        Text(
                          "Home",
                          style: TextStyle(
                            color: page == 'Home'
                                ? AppConstants.primaryColor
                                : Colors.grey,
                          ),
                        ), // <-- Text
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: const Size(56, 56),
              child: ClipOval(
                child: Material(
                  child: InkWell(
                    splashColor: AppConstants.primaryColor,
                    onTap: () {
                      AppConstants.nextScreen(context, CMSPage());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.arrowsToCircle,
                          size: 20,
                          color: page == 'CMS'
                              ? AppConstants.primaryColor
                              : Colors.grey,
                        ), // <-- Icon
                        Text(
                          "CMS",
                          style: TextStyle(
                            color: page == 'CMS'
                                ? AppConstants.primaryColor
                                : Colors.grey,
                          ),
                        ), // <-- Text
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: const Size(56, 56),
              child: ClipOval(
                child: Material(
                  child: InkWell(
                    splashColor: AppConstants.primaryColor,
                    onTap: () {
                      AppConstants.nextScreen(context, AnnouncementPageAD());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        Icon(
                          Icons.newspaper,
                          size: 30,
                          color: page == 'News'
                              ? AppConstants.primaryColor
                              : Colors.grey,
                        ), // <-- Icon
                        Text(
                          "News",
                          style: TextStyle(
                            color: page == 'News'
                                ? AppConstants.primaryColor
                                : Colors.grey,
                          ),
                        ), // <-- Text
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: const Size(56, 56),
              child: ClipOval(
                child: Material(
                  child: InkWell(
                    splashColor: AppConstants.primaryColor,
                    onTap: () {
                      AppConstants.nextScreen(context, SettingAD());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          size: 30,
                          color: page == 'Setting'
                              ? AppConstants.primaryColor
                              : Colors.grey,
                        ), // <-- Icon
                        Text(
                          "Setting",
                          style: TextStyle(
                            color: page == 'Setting'
                                ? AppConstants.primaryColor
                                : Colors.grey,
                          ),
                        ), // <-- Text
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
