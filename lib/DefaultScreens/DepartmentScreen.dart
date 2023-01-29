import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/AppConstants.dart';

class DepartmentScreen extends StatefulWidget {
  Map<String, dynamic>? data;
  DepartmentScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size.height / 3.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: MemoryImage(
                      Uint8List.fromList(
                          widget.data!["image"]['data'].cast<int>()),
                      scale: 1),
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
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "${widget.data!['abbreviation']}",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 10),
                  child: Text(
                    "${widget.data!['name']}",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Department Info",
              style: TextStyle(color: AppConstants.primaryColor, fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "${widget.data!['description']}",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Current Chairman",
              style: TextStyle(color: AppConstants.primaryColor, fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "${widget.data!['chairman_name']}",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Degree Programs",
              style: TextStyle(color: AppConstants.primaryColor, fontSize: 24),
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: widget.data!['programs']
                .map<Widget>((e) => Text(
                      "\u2022 $e",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppConstants.primaryColor,
                          fontSize: 18),
                    ))
                .toList(),
          )
        ])),
      ],
    ));
  }
}
