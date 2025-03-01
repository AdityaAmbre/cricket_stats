import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/core/api.dart';
import 'package:cricket_stats/util/logger.dart';
import 'package:cricket_stats/constant/constant.dart';
import 'package:cricket_stats/screen/match_view/match_view.dart';

class SplashViewModel extends BaseViewModel {
  BuildContext context;
  bool isLoading = false;
  Api api = Api();

  SplashViewModel(this.context);

  void init() async {
    Logger.logTitle("SplashViewModel INIT", "init ${Constant.appName}");

    await loadData();
    redirectToNextPage();
  }

  void toggleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  /// Load data from API
  loadData() async {
    // Call First Match API
    toggleLoading();
    await api.apiCallHttpGet(Constant.matchFirstURL);
    toggleLoading();

    // Call Second Match API
    toggleLoading();
    await api.apiCallHttpGet(Constant.matchSecondURL);
    toggleLoading();
  }

  /// Re-direct to Match View
  void redirectToNextPage() {
    Get.to(const MatchView());
  }
}