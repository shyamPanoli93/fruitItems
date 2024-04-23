
import 'package:azinova_machine_test/pages/homescreen.dart';
import 'package:azinova_machine_test/pages/login.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Routes.loginScreen: (context) =>   LoginBody(),
  Routes.homeScreen: (context) => const HomeScreen(),
};

class Routes{
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';
}