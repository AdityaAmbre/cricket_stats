import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cricket_stats/util/logger.dart';
import 'package:cricket_stats/constant/constant.dart';

class SplashViewModel extends BaseViewModel {
  BuildContext context;

  SplashViewModel(this.context);

  void init() async {
    Logger.logTitle("SplashViewModel INIT", "init ${Constant.appName}");
  }
}