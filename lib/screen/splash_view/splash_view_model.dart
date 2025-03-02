import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/core/api.dart';
import 'package:cricket_stats/util/logger.dart';
import 'package:cricket_stats/constant/constant.dart';
import 'package:cricket_stats/model/cricket_model.dart';
import 'package:cricket_stats/screen/match_view/match_view.dart';

class SplashViewModel extends BaseViewModel {
  BuildContext context;
  bool isLoading = false;
  Api api = Api();
  CricketModel? cricketModelFirstApi;
  CricketModel? cricketModelSecondApi;
  List<CricketModel?>? cricketModelApiList = [];

  SplashViewModel(this.context);

  void init() async {
    Logger.logTitle("SplashViewModel INIT", "init ${Constant.appName}");

    await loadData();
    loadResponseModelList();
    redirectToNextPage();
  }

  /// Loader
  void toggleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  /// Load data from API
  Future<void> loadData() async {
    cricketModelFirstApi = await apiCall(Constant.matchFirstURL);
    cricketModelSecondApi = await apiCall(Constant.matchSecondURL);
  }

  /// Handle API Call
  Future<CricketModel?> apiCall(String url) async {
    CricketModel? cricketModel;

    // API Call
    toggleLoading();
    Map<String, dynamic>? data = await api.apiCallHttpGet(url);
    if (data != null) {
      cricketModel = CricketModel.fromJson(data);
    }
    toggleLoading();

    // Handle Response
    if (cricketModel != null) {
      return cricketModel;
    } else {
      return null;
    }
  }

  void loadResponseModelList() {
    if (cricketModelFirstApi != null) {
      cricketModelApiList?.add(cricketModelFirstApi);
    }
    if (cricketModelSecondApi != null) {
      cricketModelApiList?.add(cricketModelSecondApi);
    }
  }

  /// Re-direct to Match View
  void redirectToNextPage() {
    if (cricketModelApiList != null) {
      if (cricketModelApiList!.isNotEmpty) {
        Get.offAll(MatchView(cricketModelApiList!));
      }
    }
  }
}