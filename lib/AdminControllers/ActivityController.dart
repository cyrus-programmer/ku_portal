import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ku_portal/Auth.dart';
import 'package:ku_portal/Models/ActivityModel.dart';

class ActivityController {
  static Future addScholarship(Map<String, dynamic> body) async {
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.post(
        Uri.parse("http://192.168.10.15:8081/api/activities"),
        body: body,
        headers: headers);
  }

  static Future<List<ActivityModel>> getActivities() async {
    var headers = {
      "authorization": "Bearer $AuthData.token",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.get(
        Uri.parse("http://192.168.10.15:8081/api/activities"),
        headers: headers);
    var data = json.decode(response.body);
    List<ActivityModel> activities = await data
        .map<ActivityModel>((json) => ActivityModel.fromJson(json))
        .toList();
    return activities;
  }
}
