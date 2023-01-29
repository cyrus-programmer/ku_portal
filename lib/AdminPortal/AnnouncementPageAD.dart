import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/AdminControllers/ActivityController.dart';
import 'package:ku_portal/AdminControllers/ScholarController.dart';
import 'package:ku_portal/Models/ActivityModel.dart';
import 'package:ku_portal/Models/ScholarshipModel.dart';

import '../Widgets/ActivityCard.dart';
import '../utils/AppConstants.dart';
import 'AnnouncementPage.dart';
import 'NavigatorBarAD.dart';

class AnnouncementPageAD extends StatefulWidget {
  const AnnouncementPageAD({Key? key}) : super(key: key);

  @override
  _AnnouncementPageADState createState() => _AnnouncementPageADState();
}

class _AnnouncementPageADState extends State<AnnouncementPageAD> {
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
        return CircularProgressIndicator();
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
        return CircularProgressIndicator();
      },
    );
  }

  ListView cards(data, BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ActivityCard(
              activity: "Activity " + (index + 1).toString(),
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
              activity: "Scholarship " + (index + 1).toString(),
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
                    "Anouncements",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: AppConstants.primaryColor, width: 1.0),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0),
              onTap: () {
                AppConstants.nextScreen(context, AddAnnouncement());
              },
              child: Icon(
                Icons.add,
                color: AppConstants.primaryColor,
                size: 24,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigatorBarAD(
        page: 'News',
      ),
    );
  }
}
