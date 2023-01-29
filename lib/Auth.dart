import 'package:ku_portal/Models/UserModel.dart';

class AuthData {
  static UserModel? user;
  static void setUser(UserModel user1) {
    user = user1;
  }

  static String? token;
  static void setToken(String token1) {
    token = token1;
  }
}
