import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/StudentPortal/LoginPage.dart';

import '../utils/AppConstants.dart';
import 'NavigatorBar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = true;
  bool isSwitched1 = true;
  bool isSwitched2 = true;

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  void toggleSwitch1(bool value) {
    setState(() {
      isSwitched1 = !isSwitched1;
    });
  }

  void toggleSwitch2(bool value) {
    setState(() {
      isSwitched2 = !isSwitched2;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  "Settings",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10),
          child: Text(
            "General Settings",
            style: TextStyle(color: AppConstants.primaryColor, fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Divider(
            color: AppConstants.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Popup Notification",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Expanded(child: Container()),
                  Transform.scale(
                      scale: 1,
                      child: Switch(
                        onChanged: toggleSwitch,
                        value: isSwitched,
                        activeColor: AppConstants.primaryColor,
                        activeTrackColor: Colors.red.shade700,
                        inactiveThumbColor: Colors.grey.shade700,
                        inactiveTrackColor: Colors.grey,
                      )),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "CMS Update Settings",
                style: TextStyle(color: Colors.black, fontSize: 20),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20),
          child: Text(
            "Secondary Settings",
            style: TextStyle(color: AppConstants.primaryColor, fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Divider(
            color: AppConstants.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Event Update Notification",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Expanded(child: Container()),
                  Transform.scale(
                      scale: 1,
                      child: Switch(
                        onChanged: toggleSwitch1,
                        value: isSwitched1,
                        activeColor: AppConstants.primaryColor,
                        activeTrackColor: Colors.red.shade700,
                        inactiveThumbColor: Colors.grey.shade700,
                        inactiveTrackColor: Colors.grey,
                      )),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "Student data record",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    "Dark Mode",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Expanded(child: Container()),
                  Transform.scale(
                      scale: 1,
                      child: Switch(
                        onChanged: toggleSwitch2,
                        value: isSwitched2,
                        activeColor: AppConstants.primaryColor,
                        activeTrackColor: Colors.red.shade700,
                        inactiveThumbColor: Colors.grey.shade700,
                        inactiveTrackColor: Colors.grey,
                      )),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20),
          child: Text(
            "Secondary Settings",
            style: TextStyle(color: AppConstants.primaryColor, fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Divider(
            color: AppConstants.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "Admin Profile",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 15),
              const Text(
                "Dev Support",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  AppConstants.nextScreenReplace(context, const Login());
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ])),
      bottomNavigationBar: NavigatorBottomAppBar(page: 'Setting'),
    );
  }
}
