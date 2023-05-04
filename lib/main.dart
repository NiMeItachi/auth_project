import 'package:flutter/material.dart';
import 'package:learn_auth/service_locator.dart';
import 'app.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}