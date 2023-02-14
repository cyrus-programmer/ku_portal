import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ku_portal/AdminControllers/LoginController.dart';
import 'package:ku_portal/AdminPortal/LoginPageAd.dart';
import 'package:ku_portal/Widgets/AppBarImage.dart';
import 'package:ku_portal/Widgets/LoginTypeText.dart';
import 'package:ku_portal/Widgets/button.dart';
import 'package:ku_portal/utils/AppConstants.dart';

class SignUpAdmin extends StatefulWidget {
  const SignUpAdmin({Key? key}) : super(key: key);

  @override
  State<SignUpAdmin> createState() => _SignUpAdminState();
}

class _SignUpAdminState extends State<SignUpAdmin> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController iDController = TextEditingController();
  TextEditingController seatController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isPasswordHide = true;

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
            "SignUp",
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
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  hintText: "First Name",
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  hintText: "Last Name",
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Phone Number",
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
                controller: iDController,
                decoration: const InputDecoration(
                  hintText: "Admin ID",
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
                controller: seatController,
                decoration: const InputDecoration(
                  hintText: "Seat Number",
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 37),
            child: TextField(
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
            child: ButtonWidget(
                backgroundColor: AppConstants.primaryColor,
                text: "SignUp",
                textColor: Colors.white),
          ),
          const SizedBox(height: 37),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(color: HexColor('#808080')),
              ),
              GestureDetector(
                onTap: () {
                  var value = LoginController.addUser({
                    "seat_number": seatController.text,
                    "admin_id": iDController.text,
                    "first_name": firstNameController.text,
                    "last_name": lastNameController.text,
                    "email": emailController.text,
                    "phone": phoneController.text,
                    "role": "admin",
                    "password": passwordController.text
                  });
                  if (value == 200) {
                    AppConstants.nextScreenReplace(context, const LognAdmin());
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    AppConstants.nextScreenReplace(context, LognAdmin());
                  },
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                        color: AppConstants.primaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
