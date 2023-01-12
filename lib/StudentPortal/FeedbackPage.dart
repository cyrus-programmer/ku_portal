import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/Widgets/button.dart';

import '../utils/AppConstants.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
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
                "Feedback",
                style: TextStyle(color: Colors.white, fontSize: 24),
              )
            ],
          ),
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: "Add Subject",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey))),
          maxLines: 3,
        ),
      ),
      SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: "Add feedback",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey))),
          maxLines: 10,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonWidget(
                backgroundColor: AppConstants.primaryColor,
                text: "Post",
                textColor: Colors.white)
          ],
        ),
      ),
    ])));
  }
}
