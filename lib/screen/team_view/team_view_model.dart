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
  List<Player> players = [];
  List<Player>? playerList;
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

  void mapTeams() {
    teamMap?.forEach((teamName, team) {
      String selectedTeam = "${isTeamASelected ? cricketModelApiList[selectedIndex]?.matchdetail?.teamAway : cricketModelApiList[selectedIndex]?.matchdetail?.teamHome}";
      if (teamName == selectedTeam) {
        team.players.forEach((playerName, player) {
          players.add(player);
        });
        return;
      }
    });

    Logger.log("Players:", players.toString());
  }

  void showAlertDialog(BuildContext context, int index, String player) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Statistics', style: TextStyle(fontSize: 22),),
              const SizedBox(height: 2.5),
              Text('Player: $player', style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
              const Divider(),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Batting", style: TextStyle(fontSize: 20)),
                const SizedBox(height: 5.0),
                Text("• Style: ${players[index].batting?.style}", style: const TextStyle(fontSize: 16)),
                Text("• Average: ${players[index].batting?.average}", style: const TextStyle(fontSize: 16)),
                Text("• Strike Rate: ${players[index].batting?.strikerate}", style: const TextStyle(fontSize: 16)),
                Text("• Runs: ${players[index].batting?.runs}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20.0),
                const Text("Bowling", style: TextStyle(fontSize: 20)),
                const SizedBox(height: 5.0),
                Text("• Style: ${players[index].bowling?.style}", style: const TextStyle(fontSize: 16)),
                Text("• Average: ${players[index].bowling?.average}", style: const TextStyle(fontSize: 16)),
                Text("• Economy Rate: ${players[index].bowling?.economyrate}", style: const TextStyle(fontSize: 16)),
                Text("• Wickets: ${players[index].bowling?.wickets}", style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("EXIT"),
            ),
          ],
        );
      },
    );
  }

  void onBackClick() {
    Get.back();
  }
}