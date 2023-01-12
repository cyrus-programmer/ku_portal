import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/AdminPortal/AnnouncementPage.dart';
import 'package:ku_portal/AdminPortal/NavigatorBarAD.dart';
import 'package:ku_portal/StudentPortal/NavigatorBar.dart';
import 'package:ku_portal/StudentPortal/NewsPage.dart';
import 'package:ku_portal/StudentPortal/NotificationPage.dart';
import 'package:ku_portal/Widgets/CarouselContainer.dart';
import 'package:ku_portal/Widgets/UpdatedCarouselItem.dart';

import '../utils/AppConstants.dart';

class AdminDashboard extends StatefulWidget {
  AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          "DashBoard",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                      decoration: InputDecoration(
                          isDense: true, // Added this
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: AppConstants.primaryColor)),
                          hintText: "Search Info",
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.search,
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
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
            child: Text(
              "Departments",
              style: TextStyle(color: AppConstants.primaryColor, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: CarouselSlider(
                items: [
                  CarouselItem(
                      department: 'DCS-UBIT', imagePath: 'assets/ubit.jpg'),
                  CarouselItem(
                      department: 'Mass-Com', imagePath: 'assets/mascom.png'),
                  CarouselItem(
                      department: 'Dept-DPA', imagePath: 'assets/dpa.jpg'),
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
              style: TextStyle(color: AppConstants.primaryColor, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: CarouselSlider(
                items: [
                  UpdatedCarouselItem(
                      page: true,
                      color: AppConstants.primaryColor,
                      heading: "HEC-Scholarship",
                      subHeading: "Batch-01",
                      imagePath: 'assets/ku.png'),
                  UpdatedCarouselItem(
                      page: true,
                      color: AppConstants.primaryColor,
                      heading: "HEC-Scholarship",
                      subHeading: "Batch-02",
                      imagePath: 'assets/ku.png'),
                  UpdatedCarouselItem(
                      page: true,
                      color: AppConstants.primaryColor,
                      heading: "HEC-Scholarship",
                      subHeading: "Batch-03",
                      imagePath: 'assets/ku.png'),
                  UpdatedCarouselItem(
                      page: true,
                      color: AppConstants.primaryColor,
                      heading: "HEC-Scholarship",
                      subHeading: "Batch-04",
                      imagePath: 'assets/ku.png'),
                ],
                options: CarouselOptions(
                  height: 80,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.5,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
            child: Text(
              "Activities",
              style: TextStyle(color: AppConstants.primaryColor, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: CarouselSlider(
                items: [
                  UpdatedCarouselItem(
                      page: false,
                      color: AppConstants.primaryColor,
                      heading: "HEC-Scholarship",
                      subHeading: "Batch-01",
                      imagePath: 'assets/ku.png'),
                  UpdatedCarouselItem(
                      page: false,
                      color: Colors.blue,
                      heading: "HEC-Scholarship",
                      subHeading: "Batch-02",
                      imagePath: 'assets/ku.png'),
                  UpdatedCarouselItem(
                      page: false,
                      color: Colors.amber,
                      heading: "HEC-Scholarship",
                      subHeading: "Batch-03",
                      imagePath: 'assets/ku.png'),
                  UpdatedCarouselItem(
                      page: false,
                      color: AppConstants.primaryColor,
                      heading: "HEC-Scholarship",
                      subHeading: "Batch-04",
                      imagePath: 'assets/ku.png'),
                ],
                options: CarouselOptions(
                  height: 80,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.5,
                )),
          ),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
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
        page: "Home",
      ),
    );
  }
}
