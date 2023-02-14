import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ku_portal/AdminControllers/DepartmentController.dart';
import 'package:ku_portal/Models/DepartmentModel.dart';
import 'package:ku_portal/Widgets/TextFieldAdminWigt.dart';
import 'package:ku_portal/Widgets/button.dart';
import 'package:http/http.dart' as http;
import '../utils/AppConstants.dart';

class AddDepartment extends StatefulWidget {
  const AddDepartment({Key? key}) : super(key: key);

  @override
  State<AddDepartment> createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  String filePath = ' ';
  String fileName = ' ';
  String imageUrl = ' ';

  String? value1;
  String? prtId;
  List data = [];
  List? bigData;
  TextEditingController nameController = TextEditingController();
  TextEditingController fullFormController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController chairManController = TextEditingController();
  List<String> programs = [];
  TextEditingController programController = TextEditingController();
  addProgram() {
    programs.add(programController.text);
    programController.clear();
  }

  String? imageBuffer;
  loadFile() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    var link = await uploadImage(
        file!.path, "http://${AppConstants.ipAddress}:8081/api/upload");
    setState(() {
      imageUrl = link;
      fileName = file.name;
      filePath = file.path;
    });
  }

  Future<String> uploadImage(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.files.add(await http.MultipartFile.fromPath("file", filename));

    var res = await request.send();

    return await res.stream.bytesToString();
  }

  Future<void> loadData() async {
    var d = await DepartmentController.getParents();
    var n = [];
    for (var element in d) {
      n.add(element['name']);
    }
    setState(() {
      data = n;
      bigData = d;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
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

            DropdownButton(
                value: value1,
                isExpanded: true,
                hint: const Text("Select Department Category"),
                items: data.map((name) {
                  return DropdownMenuItem(
                    value: name,
                    child: Text(name),
                  );
                }).toList(),
                onChanged: ((value) {
                  setState(() {
                    value1 = value.toString();
                    for (var element in bigData!) {
                      if (element['name'] == value1) {
                        prtId = element['_id'];
                      }
                    }
                  });
                })),
            // TextFieldAdminWigt(
            //     controller: catController, text: "Department Category"),

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
                        child: SingleChildScrollView(child: Text(fileName))),
                    IconButton(
                        onPressed: (() {
                          loadFile();
                        }),
                        icon: const Icon(Icons.add_a_photo))
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
            GestureDetector(
              onTap: () {
                DepartmentController.addDepartment({
                  "name": fullFormController.text,
                  "description": descController.text,
                  "chairman_name": chairManController.text,
                  "abbreviation": nameController.text,
                  "image": imageUrl,
                  "parent": prtId,
                  "programs": programs.toString()
                });
              },
              child: ButtonWidget(
                  backgroundColor: AppConstants.primaryColor,
                  text: "Add",
                  textColor: Colors.white),
            )
          ],
        ),
      ),
    ])));
  }
}
