import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ku_portal/AdminControllers/LoginController.dart';
import 'package:ku_portal/StudentPortal/SignUpPage.dart';
import 'package:ku_portal/StudentPortal/StudentDashBoard.dart';
import 'package:ku_portal/Widgets/AppBarImage.dart';
import 'package:ku_portal/Widgets/LoginTypeText.dart';
import 'package:ku_portal/Widgets/button.dart';
import 'package:ku_portal/utils/AppConstants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordHide = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              LoginTypeText(
                  text: "Student", textColor: AppConstants.primaryColor),
              LoginTypeText(
                text: "Admin",
                textColor: HexColor('##1E1E1E'),
              ),
            ],
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
                keyboardType: TextInputType.text,
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Student ID",
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
                keyboardType: TextInputType.text,
                controller: passwordController,
                obscureText: isPasswordHide,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: FaIcon(isPasswordHide
                        ? FontAwesomeIcons.eye
                        // ignore: dead_code
                        : FontAwesomeIcons.eyeSlash),
                    onPressed: () {
                      setState(() {
                        isPasswordHide = !isPasswordHide;
                      });
                    },
                  ),
                )),
          ),
          GestureDetector(
            onTap: () async {
              var value = await LoginController.loginVerify(
                  emailController.text, passwordController.text);
              value == 200
                  ? AppConstants.nextScreenReplace(context, StdDashBoard())
                  : null;
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
                  AppConstants.nextScreenReplace(context, const SignUp());
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
