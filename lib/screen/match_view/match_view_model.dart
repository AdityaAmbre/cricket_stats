import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/util/logger.dart';
import 'package:cricket_stats/constant/constant.dart';
import 'package:cricket_stats/model/cricket_model.dart';

class MatchViewModel extends BaseViewModel {
  BuildContext context;
  final List<CricketModel?> cricketModelApiList;

  MatchViewModel(this.context, this.cricketModelApiList);

  void init() async {
    Logger.logTitle("MatchViewModel INIT", "init ${Constant.appName}");
  }

  String getTeamsIndex(int index) {
    debugPrint("teamIndex:: $index");
    String teamIndex = index.toString();
    if (index == 0) {
      index = index+4;
      teamIndex = index.toString();
    } else if (index == 1) {
      index = index+5;
      teamIndex =  index.toString();
    } else{
      teamIndex =  index.toString();
    }
    // debugPrint("teamIndex: $teamIndex");
    return teamIndex;
  }

  void onMenuClick() {
    Logger.logTitle("MatchViewModel Menu", "onMenuClick");
  }
}