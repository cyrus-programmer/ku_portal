import 'package:flutter/material.dart';
import 'package:ku_portal/DefaultScreens/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KU Portal',
      home: Splash(),
    );
  }
}
