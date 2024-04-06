import 'package:babalomoda/app.dart';
import 'package:babalomoda/core/config/shared_pref.dart';
import 'package:babalomoda/core/network/dio_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  Preferences.init();

  Future.delayed(const Duration(milliseconds: 800), () {
    runApp(const MyApp());
  });
}
