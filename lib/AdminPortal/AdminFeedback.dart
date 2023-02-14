import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/AdminControllers/FeedbackController.dart';
import 'package:ku_portal/Widgets/FeedbackCard.dart';
import 'package:ku_portal/Widgets/MonthButton.dart';

import '../utils/AppConstants.dart';

// ignore: prefer_const_literals_to_create_immutables
int today = DateTime.now().year;

List<String> monthsList = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

class FeedBackAD extends StatefulWidget {
  const FeedBackAD({Key? key}) : super(key: key);

  @override
  State<FeedBackAD> createState() => _FeedBackADState();
}

class _FeedBackADState extends State<FeedBackAD> {
  bool isMonth = false;
  int month = 0;
  FutureBuilder getScholarship(BuildContext context) {
    return FutureBuilder<List>(
      future: FeedbackController.getFeedbacks(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          List? data = snapshot.data;
          return cards(data, context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  FutureBuilder getFeedbacksByMonth(BuildContext context, int index) {
    return FutureBuilder<List>(
      future: FeedbackController.getFeedbacksByMonth(index),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Text(
              "No Feedback Available for this Month",
              style: TextStyle(color: AppConstants.primaryColor, fontSize: 20),
            );
          }
          List? data = snapshot.data;
          return cards(data, context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  ListView months(data, BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                isMonth = true;
                month = index + 1;
              });
              // FeedbackController.getFeedbacksByMonth(index + 1);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: MonthButton(month: data[index]),
            ),
          );
        });
  }

  ListView cards(data, BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: FeedbackCard(
              fbNo: "Feedback ${index + 1}",
              subject: data[index].subject,
              desc: data[index].message,
              stdId: data[index].user.seatNumber,
              stdName:
                  "${data[index].user.firstName} ${data[index].user.lastName}",
              stdDept: "N/A",
              stdSem: "N/A",
              stdYear: "N/A",
            ),
          );
        });
  }

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
                "Feedbacks",
                style: TextStyle(color: Colors.white, fontSize: 24),
              )
            ],
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.maxFinite,
            height: size.height / 12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.black.withOpacity(0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 12, right: 12),
                child: Row(
                  children: [
                    SizedBox(
                        width: size.width / 1.1,
                        child: months(monthsList, context))
                  ],
                ),
              ),
            ),
          )),
      isMonth
          ? SizedBox(
              height: size.height / 1.2,
              child: getFeedbacksByMonth(context, month))
          : SizedBox(height: size.height / 1.2, child: getScholarship(context))
    ])));
  }
}
