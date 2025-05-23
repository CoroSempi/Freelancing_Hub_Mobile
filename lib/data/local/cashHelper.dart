import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class CashHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
        WidgetsFlutterBinding.ensureInitialized();

    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key).catchError((erorr) {
      return erorr;
    });
  }
}
