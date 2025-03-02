import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/util/logger.dart';
import 'package:cricket_stats/constant/constant.dart';
import 'package:cricket_stats/model/cricket_model.dart';

class TeamViewModel extends BaseViewModel {
  BuildContext context;
  final List<CricketModel?> cricketModelApiList;
  final int selectedIndex;
  Map<String, Team>? teamMap;
  bool isTeamASelected = true;
  bool isTeamBSelected = false;

  TeamViewModel(this.context, this.cricketModelApiList, this.selectedIndex);

  void init() async {
    Logger.logTitle("TeamViewModel INIT", "init ${Constant.appName}");
    loadTeamsList();
  }

  void loadTeamsList() {
    Logger.log("Selected Index:", "$selectedIndex");
    if (cricketModelApiList.isNotEmpty) {
      teamMap = cricketModelApiList[selectedIndex]?.teams;
    }
    Logger.log("TeamMap: ", teamMap.toString());
  }

  void onTapTeamSelection(int index) {
    if (index == 0) {
      isTeamASelected = true;
      isTeamBSelected = false;
    } else {
      isTeamASelected = false;
      isTeamBSelected = true;
    }
    notifyListeners();
  }

  void onBackClick() {
    Get.back();
  }
}