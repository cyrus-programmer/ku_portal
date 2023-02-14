// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ku_portal/AdminPortal/LoginPageAd.dart';
import 'package:ku_portal/StudentPortal/LoginPage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _NavigateToLogin();
  }

  _NavigateToLogin() async {
    await Future.delayed(const Duration(microseconds: 4500), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LognAdmin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(child: Image.asset('assets/logo.png')),
      ),
    );
  }
}
