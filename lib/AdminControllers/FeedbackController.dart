import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ku_portal/Models/FeedbackModel.dart';

import '../Auth.dart';
import '../utils/AppConstants.dart';

class FeedbackController {
  static Future addFeedback(Map<String, dynamic> body) async {
    var headers = {
      "authorization": "Bearer ${AuthData.token}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.post(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/feedbacks"),
        body: body,
        headers: headers);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Feedback Successfully Added",
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

  static Future<List<FeedbackModel>> getFeedbacks() async {
    var headers = {
      "Authorization": "Bearer ${AuthData.token}",
    };
    var response = await http.get(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/feedbacks"),
        headers: headers);
    var data = json.decode(response.body);
    List<FeedbackModel> activities = await data
        .map<FeedbackModel>((json) => FeedbackModel.fromJson(json))
        .toList();
    return activities;
  }

  static Future<List<FeedbackModel>> getFeedbacksByMonth(int index) async {
    var headers = {
      "Authorization": "Bearer ${AuthData.token}",
    };
    var response = await http.get(
        Uri.parse(
            "http://${AppConstants.ipAddress}:8081/api/feedbacks/byMonth?month=$index"),
        headers: headers);
    var data = json.decode(response.body);
    List<FeedbackModel> activities = await data
        .map<FeedbackModel>((json) => FeedbackModel.fromJson(json))
        .toList();
    return activities;
  }
}
