import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ku_portal/DefaultScreens/Splash.dart';
import 'package:ku_portal/StudentPortal/ActivitiesPage.dart';
import 'package:ku_portal/StudentPortal/NotificationPage.dart';
import 'package:ku_portal/StudentPortal/ScholarshipPage.dart';
import 'package:ku_portal/StudentPortal/StudentDashBoard.dart';
import 'package:ku_portal/utils/AppConstants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KU Portal',
      home: Splash(),
    );
  }
}
