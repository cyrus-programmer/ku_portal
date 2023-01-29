import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ku_portal/Models/ScholarshipModel.dart';

class ScholarController {
  static Future addScholarship(Map<String, dynamic> body) async {
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    body["charges"] = body['charges'].toString();

    var response = await http.post(
        Uri.parse("http://192.168.10.15:8081/api/scholarships"),
        body: body,
        headers: headers);
    print(1);
  }

  static Future<List<ScholarshipModel>> getScholarships() async {
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.get(
        Uri.parse("http://192.168.10.15:8081/api/scholarships"),
        headers: headers);
    var data = json.decode(response.body);
    List<ScholarshipModel> activities = await data
        .map<ScholarshipModel>((json) => ScholarshipModel.fromJson(json))
        .toList();
    return activities;
  }
}
