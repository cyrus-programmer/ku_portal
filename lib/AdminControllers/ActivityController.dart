import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:ku_portal/AdminControllers/DepartmentController.dart';
import 'package:ku_portal/Auth.dart';
import 'package:ku_portal/Models/ActivityModel.dart';
import 'package:ku_portal/utils/AppConstants.dart';

class ActivityController {
  static Future addScholarship(Map<String, dynamic> body) async {
    var headers = {
      "authorization": "Bearer ${AuthData.token}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var response = await http.post(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/activities"),
        body: body,
        headers: headers);
  }

  static Future<List<ActivityModel>> getActivities() async {
    var headers = {
      "Authorization": "Bearer ${AuthData.token}",
    };
    var response = await http.get(
        Uri.parse("http://${AppConstants.ipAddress}:8081/api/activities"),
        headers: headers);
    var data = json.decode(response.body);
    for (var activity in data) {
      print(activity);
      var dept = await DepartmentController.getDepart(activity['department']);
      activity['department'] = dept['name'];
    }
    List<ActivityModel> activities = await data
        .map<ActivityModel>((json) => ActivityModel.fromJson(json))
        .toList();
    return activities;
  }
}
