import 'dart:developer';

import 'package:azinova_machine_test/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../common.dart';
import 'GetHttpCalls.dart';
import 'api.dart';

Future<http.Response?> GetListItems(BuildContext context) async {
  try {
    Map<String, dynamic>? requestData;
    final response = await GetHTTP_Requests(
        context,
        AppConstants.GET,
        getList(),
        requestData);
    log('Response LIST Test=====${response?.body}');
    return response;
  } catch (e) {
    showSnackBar(context, "Some Error Occured");
    log('Catch Error list... $e');
    const response = null;
    return response;
  }
}