import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/util/logger.dart';
import 'package:cricket_stats/constant/constant.dart';

class TeamViewModel extends BaseViewModel {
  BuildContext context;

  TeamViewModel(this.context);

  void init() async {
    Logger.logTitle("TeamViewModel INIT", "init ${Constant.appName}");
  }
}