import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ku_portal/AdminPortal/AdminDashboard.dart';
import 'package:ku_portal/Auth.dart';
import 'package:ku_portal/Models/UserModel.dart';
import 'package:ku_portal/Widgets/Message.dart';
import 'package:ku_portal/utils/AppConstants.dart';

class LoginController {
  static Future loginVerify(
      String email, String password, BuildContext context) async {
    var body = {
      "email": email,
      "password": password,
    };
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.post(
      Uri.parse("http://192.168.10.15:8081/api/login"),
      body: body,
    );
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
      AppConstants.nextScreenReplace(context, AdminDashboard());
    } else {
      Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConstants.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
