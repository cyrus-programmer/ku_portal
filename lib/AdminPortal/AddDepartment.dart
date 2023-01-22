import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/Widgets/TextFieldAdminWigt.dart';
import 'package:ku_portal/Widgets/button.dart';

import '../utils/AppConstants.dart';

class AddDepartment extends StatefulWidget {
  const AddDepartment({Key? key}) : super(key: key);

  @override
  State<AddDepartment> createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  String filePath = ' ';
  TextEditingController nameController = TextEditingController();
  TextEditingController catController = TextEditingController();
  TextEditingController fullFormController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController chairManController = TextEditingController();
  List<String> programs = [];
  TextEditingController programController = TextEditingController();
  addProgram() {
    programs.add(programController.text);
    programController.clear();
  }

  loadFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        filePath = file.path;
      });
    } else {
      print("Not found");
      // User canceled the picker
    }
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
                "Add Department",
                style: TextStyle(color: Colors.white, fontSize: 24),
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Department Details",
              style: TextStyle(color: AppConstants.primaryColor, fontSize: 22),
            ),
            const SizedBox(height: 15),
            TextFieldAdminWigt(
                controller: nameController, text: "Department abbreviation"),
            const SizedBox(height: 15),
            TextFieldAdminWigt(
                controller: fullFormController, text: "Department Name"),
            const SizedBox(height: 15),
            TextFieldAdminWigt(
                controller: chairManController, text: "Department Chairman"),
            const SizedBox(height: 15),
            TextFieldAdminWigt(
              controller: descController,
              text: "Department Description",
              lines: 5,
            ),
            const SizedBox(height: 15),
            TextFieldAdminWigt(
                controller: catController, text: "Department Category"),
            const SizedBox(height: 15),
            Container(
              height: 60,
              width: size.width / 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppConstants.primaryColor),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: SingleChildScrollView(child: Text(filePath))),
                    IconButton(
                        onPressed: (() {
                          loadFile();
                        }),
                        icon: Icon(Icons.add_a_photo))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width / 2,
                  child: TextFieldAdminWigt(
                      controller: programController, text: "Program"),
                ),
                GestureDetector(
                  onTap: (() {
                    addProgram();
                  }),
                  child: ButtonWidget(
                    backgroundColor: AppConstants.primaryColor,
                    text: "Add Program",
                    textColor: Colors.white,
                    width: 130,
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            ButtonWidget(
                backgroundColor: AppConstants.primaryColor,
                text: "Add",
                textColor: Colors.white)
          ],
        ),
      ),
    ])));
  }
}
