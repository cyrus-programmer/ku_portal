import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/Auth.dart';
import 'package:ku_portal/StudentPortal/NavigatorBar.dart';
import 'package:ku_portal/StudentPortal/NotificationPage.dart';
import 'package:ku_portal/Widgets/CarouselContainer.dart';
import 'package:ku_portal/Widgets/UpdatedCarouselItem.dart';

import '../AdminControllers/ActivityController.dart';
import '../AdminControllers/ScholarController.dart';
import '../Models/ActivityModel.dart';
import '../Models/ScholarshipModel.dart';
import '../utils/AppConstants.dart';

class StdDashBoard extends StatefulWidget {
  const StdDashBoard({Key? key}) : super(key: key);

  @override
  State<StdDashBoard> createState() => _StdDashBoardState();
}

class _StdDashBoardState extends State<StdDashBoard> {
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

  CarouselSlider cards(data, BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          height: 80,
          aspectRatio: 16 / 9,
          viewportFraction: 0.5,
        ),
        itemCount: data.length,
        itemBuilder: (BuildContext context, index, pageView) {
          return UpdatedCarouselItem(
            color: AppConstants.primaryColor,
            heading: data[index].name,
            imagePath: "assets/ku.png",
            page: false,
            subHeading: "Batch-${index + 1}",
          );
        });
  }

  FutureBuilder getScholarhip(BuildContext context) {
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

  CarouselSlider cards1(data, BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          height: 80,
          aspectRatio: 16 / 9,
          viewportFraction: 0.5,
        ),
        itemCount: data.length,
        itemBuilder: (BuildContext context, index, pageView) {
          return UpdatedCarouselItem(
            color: AppConstants.primaryColor,
            heading: data[index].name,
            imagePath: "assets/ku.png",
            page: false,
            subHeading: "Batch-${index + 1}",
          );
        });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height / 3.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: const AssetImage('assets/ku.png'),
                  fit: BoxFit.cover),
              color: AppConstants.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          "DashBoard",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              AppConstants.nextScreen(
                                  context, const NotificationPage());
                            },
                            // ignore: prefer_const_constructors
                            icon: FaIcon(
                              FontAwesomeIcons.solidBell,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  Text(
                    "Hi Student!",
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                      controller: searchController,
                      maxLength: 300,
                      decoration: InputDecoration(
                          isDense: false,
                          // Added this
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: AppConstants.primaryColor)),
                          hintText: "Search Info",
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: IconButton(
                            onPressed: (() {
                              searchController.text = AuthData.token!;
                            }),
                            icon: const Icon(Icons.search),
                            color: AppConstants.primaryColor,
                          ),
                          suffixIcon: Icon(
                            Icons.filter_list_outlined,
                            color: AppConstants.primaryColor,
                          )))
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                  child: Text(
                    "Departments",
                    style: TextStyle(
                        color: AppConstants.primaryColor, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: CarouselSlider(
                      items: [
                        CarouselItem(
                            department: 'DCS-UBIT',
                            imagePath: 'assets/ubit.jpg'),
                        CarouselItem(
                            department: 'Mass-Com',
                            imagePath: 'assets/mascom.png'),
                        CarouselItem(
                            department: 'Dept-DPA',
                            imagePath: 'assets/dpa.jpg'),
                      ],
                      options: CarouselOptions(
                        height: 80,
                        aspectRatio: 4 / 4,
                        viewportFraction: 0.4,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                  child: Text(
                    "Scholarships",
                    style: TextStyle(
                        color: AppConstants.primaryColor, fontSize: 24),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: getScholarhip(context)),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                  child: Text(
                    "Activities",
                    style: TextStyle(
                        color: AppConstants.primaryColor, fontSize: 24),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: getAcivities(context)),
              ],
            )),
          ),
        ],
      ),
      bottomNavigationBar: NavigatorBottomAppBar(
        page: "Home",
      ),
    );
  }
}
