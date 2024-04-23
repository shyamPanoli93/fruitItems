import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../common.dart';


Future<http.Response?> GetHTTP_Requests(
    BuildContext context, String httpMethod, String url, Map<String, dynamic>? requestData) async {
  final client = http.Client();
  try {
    //  print(url);
    log('Calling Url : $url');

    bool isConnected = await checkInternetConnectivity();
    if(isConnected) {
      final request = http.Request(httpMethod, Uri.parse(url));

      const timeoutDuration = Duration(seconds: 30);

      // Add the request body if available
      if (requestData != null) {
        request.body = jsonEncode(requestData);
        request.headers['Content-Type'] = 'application/json';
        print('Request Body: ${request.body}');
      }

      final streamedResponse =
      await client.send(request).timeout(timeoutDuration);

      final response = await http.Response.fromStream(streamedResponse);

      return response; // Return the response here
    }else{
      //showSnackBar(context, "No Internet !");
      showNetworkDialogBox(context);
      const response = null;
      return response;
    }
  } on TimeoutException catch (e) {
    // Handle timeout exception
    showSnackBar(context, "Request Timeout");
    print('Request timed out: $e');
    const response = null;
    return response;
// Rethrow the exception if needed
  } catch (e) {
    // Handle other exceptions
    print('Error occurred: $e');
    showSnackBar(context, "Some Error Occured");
    const response = null;
    return response;
// Rethrow the exception if needed
  } finally {
    client.close();
  }
}
