import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../AdminControllers/ScholarController.dart';
import '../Models/ScholarshipModel.dart';
import '../Widgets/ActivityCard.dart';
import '../utils/AppConstants.dart';

class ScholarshipPage extends StatefulWidget {
  const ScholarshipPage({Key? key}) : super(key: key);

  @override
  _ScholarshipPageState createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
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
                    "Scholarships",
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
                  height: size.height / 1.2,
                  child: getScholarship(context),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
