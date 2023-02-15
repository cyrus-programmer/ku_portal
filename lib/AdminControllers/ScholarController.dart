import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ku_portal/Models/ScholarshipModel.dart';

import '../Auth.dart';
import '../utils/AppConstants.dart';
import 'DepartmentController.dart';

class ScholarController {
  static Future addScholarship(Map<String, dynamic> body) async {
    var headers = {
      "authorization": "Bearer ${AuthData.token}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    body["charges"] = body['charges'].toString();

    var response = await http.post(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/scholarships"),
        body: body,
        headers: headers);
  }

  static Future<List<ScholarshipModel>> getScholarships() async {
    var headers = {
      "authorization": "Bearer ${AuthData.token}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };

    var response = await http.get(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/scholarships"),
        headers: headers);
    var data = json.decode(response.body);
    for (var activity in data) {
      var dept = await DepartmentController.getDepart(activity['department']);
      activity['department'] = dept['name'];
    }
    List<ScholarshipModel> activities = await data
        .map<ScholarshipModel>((json) => ScholarshipModel.fromJson(json))
        .toList();
    return activities;
  }
}
