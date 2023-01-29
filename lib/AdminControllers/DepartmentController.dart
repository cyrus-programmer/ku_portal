import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ku_portal/Models/DepartmentModel.dart';

class DepartmentController {
  static Future addDepartment(Map<String, dynamic> body) async {
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.post(
        Uri.parse("http://192.168.10.15:8081/api/categories"),
        body: body,
        headers: headers);
  }

  static Future<List<DepartmentModel>> getDepartments() async {
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.get(
        Uri.parse("http://192.168.10.15:8081/api/categories"),
        headers: headers);
    var data = json.decode(response.body);
    List<DepartmentModel> depts = await data
        .map<DepartmentModel>((json) => DepartmentModel.fromJson(json))
        .toList();
    return depts;
  }

  static Future<List<String>> getParentDpt() async {
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.get(
        Uri.parse("http://192.168.10.15:8081/api/categories"),
        headers: headers);
    var data = json.decode(response.body);
    List<String> depts = await data.map<String>((json) {
      if (json['parent'] == null) {
        return json['name'];
      }
    }).toList();
    return depts;
  }

  static Future<List<DepartmentModel>> getParents() async {
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.get(
        Uri.parse("http://192.168.10.15:8081/api/categories"),
        headers: headers);
    var data = json.decode(response.body);
    print(data);
    List<DepartmentModel> prtDpt = await data.map<DepartmentModel>((json) {
      if (json['parent'] == null) {
        print(DepartmentModel.fromJson(json));
        return DepartmentModel.fromJson(json);
      }
    }).toList();
    print(1);
    return prtDpt;
  }
}
