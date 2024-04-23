// Function to save API results to SharedPreferences
import 'dart:convert';

import 'package:azinova_machine_test/constants.dart';
import 'package:azinova_machine_test/model/itemModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveApiResults(ItemResponse apiResults,String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonString = jsonEncode(apiResults);
  await prefs.setString(key, jsonString);
}