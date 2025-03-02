import 'package:flutter/material.dart';

class Logger {
  Logger();

  static logTitle(String tag, String msg) {
    print("\n\n------------------------------ Start $tag ------------------------------");
    print(msg);
    print("------------------------------ End $tag ------------------------------\n\n");
  }

  static log(String tag, String msg) {
    print("\n\n--------------- Start $tag ---------------");
    print(msg);
    print("--------------- End $tag ---------------\n\n");
  }

}