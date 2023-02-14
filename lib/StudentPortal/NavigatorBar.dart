import 'package:flutter/material.dart';
import 'package:ku_portal/StudentPortal/SettingPage.dart';
import 'package:ku_portal/StudentPortal/StudentDashBoard.dart';
import 'package:ku_portal/StudentPortal/StudentProfile.dart';

import '../utils/AppConstants.dart';
import 'NewsPage.dart';

class NavigatorBottomAppBar extends StatelessWidget {
  String page;
  NavigatorBottomAppBar({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                      AppConstants.nextScreenReplace(context, StdDashBoard());
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
                      AppConstants.nextScreen(context, const NewsPage());
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
                      AppConstants.nextScreen(context, const SettingPage());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
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
                            color: page == 'Settings'
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
                      AppConstants.nextScreen(context, const StudentProfile());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_pin,
                          size: 30,
                          color: page == 'Profile'
                              ? AppConstants.primaryColor
                              : Colors.grey,
                        ), // <-- Icon
                        Text(
                          "Profle",
                          style: TextStyle(
                            color: page == 'Profile'
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
