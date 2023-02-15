import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ku_portal/Models/DepartmentModel.dart';
import 'package:ku_portal/utils/AppConstants.dart';

import '../Auth.dart';

class DepartmentController {
  static Future addDepartment(Map<String, dynamic> body) async {
    print(body['programs']);
    var headers = {
      "authorization": "Bearer ${AuthData.token}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.post(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/categories"),
        body: body,
        headers: headers);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Department Successfully Added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConstants.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Try again later",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConstants.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  static Future<List> getDepartments() async {
    var headers = {
      "authorization": "Bearer ${AuthData.token}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Connection": "keep-alive"
    };
    var response = await http.get(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/categories"),
        headers: headers);
    var data = json.decode(response.body);

    return data["categories"];
  }

  static Future<List<String>> getParentDpt() async {
    var headers = {
      "authorization": "Bearer ${AuthData.token}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.get(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/categories"),
        headers: headers);
    var data = json.decode(response.body);
    // List<String> depts =
    //     await data.map<String>((json) => json["name"]).toList();

    return data;
  }

  static Future<List> getParents() async {
    var headers = {
      "authorization": "Bearer ${AuthData.token}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.get(
        Uri.parse(
            "http://${AppConstants.ipAddress}:8081/api/categories/parents"),
        headers: headers);
    var data = json.decode(response.body);
    return data;
  }

  static Future<List<Map<String, dynamic>>> getDepartment(
      List<String> ids) async {
    var headers = {
      "authorization": "Bearer ${AuthData.token}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    List<Map<String, dynamic>> dpts = [];
    for (var id in ids) {
      var response = await http.get(
          Uri.parse("http://${AppConstants.ipAddress}:8081/api/categories/$id"),
          headers: headers);
      var data = json.decode(response.body);
      try {
        dpts.add(data['result'][0]);
        // print(data['result'][0]);
      } catch (e) {
        continue;
      }
    }

    return dpts;
  }

  static Future<Map<String, dynamic>> getDepart(String ids) async {
    var headers = {
      "authorization": "Bearer ${AuthData.token}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.get(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/categories/$ids"),
        headers: headers);
    var data = json.decode(response.body);
    var dpts = data['result'][0];
    // print(data['result'][0]);

    return dpts;
  }

  static Future<List> getChildDepartments() async {
    var headers = {
      "authorization": "Bearer ${AuthData.token}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.get(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/categories/child"),
        headers: headers);
    var data = json.decode(response.body);
    return data;
  }
}
