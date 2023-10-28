import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/routes/routes_import.gr.dart';

class Utils {

  static Future<void> manipulateLogin(context) async {
    var token = await getToken();
    if(token != null){
      AutoRouter.of(context).replace(const DashBoardRoute());
    } else {
      AutoRouter.of(context).replace(const OnBoardRoute());
    }
  }

  static Future<void> saveToken(String token) async {
   final SharedPreferences preferences = await SharedPreferences.getInstance();
   preferences.setString("token", token);
  }

  static Future<String?> getToken() async {
   final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token");
  }

  static Future<void> clearAllData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

}