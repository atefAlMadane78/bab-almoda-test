// ignore_for_file: prefer_final_fields

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static SharedPreferences? prefs;
  static void init() async {
    prefs = await _prefs;
  }

  static Future<bool> remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
  }
}
