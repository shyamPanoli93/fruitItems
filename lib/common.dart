import 'dart:convert';

import 'package:azinova_machine_test/model/itemModel.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


showSnackBar(BuildContext context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)));
}


Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    return false; // No internet connection
  } else {
    return true; // Internet connection is available
  }
}
showNetworkDialogBox(BuildContext context) => showCupertinoDialog<String>(
  context: context,
  builder: (context) => CupertinoAlertDialog(
    title: const Text('No Connection'),
    content: const Text('Please check your internet connectivity'),
    actions: [
      TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
          },
          child: const Text('Ok'))
    ],
  ),
);


Future<void> saveItemToLocal(ItemResponse item) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String itemJson = jsonEncode(item);
  List<String>? savedItems = prefs.getStringList('saved_items');
  if (savedItems == null) {
    savedItems = [];
  }
  savedItems.add(itemJson);
  prefs.setStringList('saved_items', savedItems);
}
