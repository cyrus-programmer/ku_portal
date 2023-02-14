import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/Widgets/ActivityCard.dart';
import 'package:ku_portal/utils/AppConstants.dart';

import '../AdminControllers/ActivityController.dart';
import '../Models/ActivityModel.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
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
                    "Activities",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: size.height / 1.2, child: getAcivities(context))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
