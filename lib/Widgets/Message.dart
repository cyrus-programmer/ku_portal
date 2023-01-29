import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/AppConstants.dart';

class Message {
  static void errorMessage(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: AppConstants.primaryColor,
        titleText: Text(
          title,
          // ignore: prefer_const_constructors
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        messageText: Text(
          message,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ));
  }
}
