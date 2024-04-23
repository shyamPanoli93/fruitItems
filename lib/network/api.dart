

import 'dart:developer';

import '../endpoints.dart';

String getList() {
  log("GetProduction List URl:---${Endpoints.baseUrl}${Endpoints.getItems}");
  return "${Endpoints.baseUrl}${Endpoints.getItems}";
}