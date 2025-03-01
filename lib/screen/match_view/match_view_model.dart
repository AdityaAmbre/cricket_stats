import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/util/logger.dart';
import 'package:cricket_stats/constant/constant.dart';

class MatchViewModel extends BaseViewModel {
  BuildContext context;

  MatchViewModel(this.context);

  void init() async {
    Logger.logTitle("MatchViewModel INIT", "init ${Constant.appName}");
  }
}