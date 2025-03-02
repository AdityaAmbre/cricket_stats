import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/util/logger.dart';
import 'package:cricket_stats/constant/constant.dart';
import 'package:cricket_stats/model/cricket_model.dart';
import 'package:cricket_stats/screen/team_view/team_view.dart';

class MatchViewModel extends BaseViewModel {
  BuildContext context;
  final List<CricketModel?> cricketModelApiList;

  MatchViewModel(this.context, this.cricketModelApiList);

  void init() async {
    Logger.logTitle("MatchViewModel INIT", "init ${Constant.appName}");
  }

  String getTeamsIndex(int index) {
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
    Logger.log("Team Index:", "$index");
    return teamIndex;
  }

  void onMenuClick() {
    Logger.logTitle("MatchViewModel Menu", "onMenuClick");
  }

  /// Re-direct to Match View
  void redirectToNextPage(int index) {
    if (cricketModelApiList.isNotEmpty) {
      Get.to(TeamView(cricketModelApiList, index));
    }
  }
}