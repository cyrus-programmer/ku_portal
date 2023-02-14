import 'package:ku_portal/Models/UserModel.dart';

class FeedbackModel {
  String? sId;
  String? subject;
  String? message;
  String? date;
  UserModel? user;
  int? iV;

  FeedbackModel(
      {this.sId, this.subject, this.message, this.date, this.user, this.iV});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subject = json['subject'];
    message = json['message'];
    date = json['date'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    iV = json['__v'];
  }
}
