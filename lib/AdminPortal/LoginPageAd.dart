import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ku_portal/AdminControllers/LoginController.dart';
import 'package:ku_portal/AdminPortal/SignUpAdmin.dart';

import '../Widgets/AppBarImage.dart';
import '../Widgets/LoginTypeText.dart';
import '../Widgets/button.dart';
import '../utils/AppConstants.dart';
import 'AdminDashboard.dart';

class LognAdmin extends StatefulWidget {
  const LognAdmin({Key? key}) : super(key: key);

  @override
  State<LognAdmin> createState() => _LognAdminState();
}

class _LognAdminState extends State<LognAdmin> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isPasswordHide = true;
  void toggleChange() {
    setState(() {
      isPasswordHide = !isPasswordHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          AppBarImage(
            height: size.height / 3,
            imagePath: 'assets/ku.png',
          ),
          const SizedBox(height: 10),
          const Text(
            "Login",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginTypeText(text: "Student", textColor: HexColor('##1E1E1E')),
              LoginTypeText(
                text: "Admin",
                textColor: AppConstants.primaryColor,
              ),
            ],
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: email,
              decoration: const InputDecoration(
                hintText: "Admin ID",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: password,
              decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: GestureDetector(
                    onTap: () => toggleChange(),
                    child: FaIcon(isPasswordHide
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye),
                  )),
              obscureText: isPasswordHide,
            ),
          ),
          GestureDetector(
            onTap: () async {
              var value =
                  await LoginController.loginVerify(email.text, password.text);
              if (value == 200) {
                AppConstants.nextScreenReplace(context, AdminDashboard());
              }
            },
            child: ButtonWidget(
                backgroundColor: AppConstants.primaryColor,
                text: "Login",
                textColor: Colors.white),
          ),
          const SizedBox(height: 37),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create an account. ",
                style: TextStyle(color: HexColor('#808080')),
              ),
              GestureDetector(
                onTap: () {
                  AppConstants.nextScreenReplace(context, const SignUpAdmin());
                },
                child: Text(
                  "Sign-Up Now",
                  style: TextStyle(
                      color: AppConstants.primaryColor,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
