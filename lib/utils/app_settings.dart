import 'package:flutter/material.dart';

class AppSettings {
  static late double width;
  static late double height;

  static init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
