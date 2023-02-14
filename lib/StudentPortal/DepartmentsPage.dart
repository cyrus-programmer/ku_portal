import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/Widgets/UpdatedTileBox.dart';

import '../AdminControllers/DepartmentController.dart';
import '../utils/AppConstants.dart';

class DepartmentsPage extends StatefulWidget {
  const DepartmentsPage({Key? key}) : super(key: key);

  @override
  _DepartmentsPageState createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  FutureBuilder getScholarship(BuildContext context) {
    return FutureBuilder<List>(
      future: DepartmentController.getDepartments(),
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

  ListView cards(data, BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: UpdatedTileBox(
              departments: (data[index]['child']),
              text: data[index]['name'],
              width: double.maxFinite,
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
        height: size.height / 3.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('assets/ubit.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken)),
            color: AppConstants.primaryColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Departments",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                    decoration: InputDecoration(
                        isDense: true, // Added this
                        contentPadding: const EdgeInsets.all(8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide:
                                BorderSide(color: AppConstants.primaryColor)),
                        hintText: "Search department",
                        hintStyle: const TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        suffixIcon: const Icon(
                          Icons.filter_list_outlined,
                          color: Colors.grey,
                        ))),
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(height: size.height / 1.8, child: getScholarship(context)),
    ])));
  }
}
