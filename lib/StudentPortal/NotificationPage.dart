import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../AdminControllers/ActivityController.dart';
import '../AdminControllers/ScholarController.dart';
import '../Models/ActivityModel.dart';
import '../Models/ScholarshipModel.dart';
import '../Widgets/ActivityCard.dart';
import '../utils/AppConstants.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isActivity = false;
  toggleChange() {
    setState(() {
      isActivity = !isActivity;
    });
  }

  FutureBuilder getAcivities(BuildContext context) {
    return FutureBuilder<List<ActivityModel>>(
      future: ActivityController.getActivities(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ActivityModel>> snapshot) {
        if (snapshot.hasData) {
          List<ActivityModel>? data = snapshot.data;
          return cards(data, context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  FutureBuilder getScholarship(BuildContext context) {
    return FutureBuilder<List<ScholarshipModel>>(
      future: ScholarController.getScholarships(),
      builder: (BuildContext context,
          AsyncSnapshot<List<ScholarshipModel>> snapshot) {
        if (snapshot.hasData) {
          List<ScholarshipModel>? data = snapshot.data;
          return cards1(data, context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  ListView cards(data, BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ActivityCard(
              activity: "Activity ${index + 1}",
              heading: data[index].name,
              subHeading: data[index].dept,
              cost: data[index].charges.toString(),
              timing: data[index].sem,
              url: data[index].url);
        });
  }

  ListView cards1(data, BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ActivityCard(
              activity: "Scholarship ${index + 1}",
              heading: data[index].name.toString(),
              subHeading: data[index].department.toString(),
              cost: data[index].charges.toString(),
              timing: data[index].semester.toString(),
              url: data[index].url);
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
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
                    "Notifications",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    toggleChange();
                  },
                  child: Text(
                    "Scholarships",
                    style: TextStyle(
                        color: isActivity
                            ? Colors.grey
                            : AppConstants.primaryColor,
                        fontSize: 18),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    toggleChange();
                  },
                  child: Text(
                    "Activities",
                    style: TextStyle(
                        color: isActivity
                            ? AppConstants.primaryColor
                            : Colors.grey,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                isActivity
                    ? SizedBox(
                        height: size.height / 1.4, child: getAcivities(context))
                    : SizedBox(
                        height: size.height / 1.4,
                        child: getScholarship(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
