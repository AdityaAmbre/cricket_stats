import 'package:flutter/material.dart';

class Logger {
  Logger();

  static logTitle(String tag, String msg) {
    debugPrint("\n\n------------------------------ Start $tag ------------------------------");
    debugPrint(msg);
    debugPrint("------------------------------ End $tag ------------------------------\n\n");
  }

  static log(String tag, String msg) {
    debugPrint("\n\n--------------- Start $tag ---------------");
    debugPrint(msg);
    debugPrint("--------------- End $tag ---------------\n\n");
  }
}