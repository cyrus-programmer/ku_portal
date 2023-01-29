import 'package:flutter/material.dart';
import 'package:ku_portal/DefaultScreens/Splash.dart';

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
