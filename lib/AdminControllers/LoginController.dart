import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ku_portal/AdminPortal/AdminDashboard.dart';
import 'package:ku_portal/Auth.dart';
import 'package:ku_portal/Models/UserModel.dart';
import 'package:ku_portal/StudentPortal/StudentDashBoard.dart';
import 'package:ku_portal/utils/AppConstants.dart';

import '../AdminPortal/LoginPageAd.dart';

class LoginController {
  static Future<int> loginVerify(String email, String password) async {
    var body = {
      "email": email,
      "password": password,
    };

    var response = await http.post(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/login"),
        body: body,
        headers: AppConstants.headers);
    var data = json.decode(response.body);
    if (data['message'] == "success") {
      Fluttertoast.showToast(
          msg: "User Successfully Login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConstants.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
      UserModel user = UserModel.fromJson(data["user"]);
      AuthData.setUser(user);

      AuthData.setToken(data["access_token"]);
      return 200;
    } else {
      Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConstants.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
      return 400;
    }
  }

  static Future<int> addUser(Map<String, dynamic> body) async {
    var response = await http.post(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/register"),
        headers: AppConstants.headers,
        body: body);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "User Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConstants.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
      return 200;
    } else {
      Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConstants.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
      return 400;
    }
  }
}
