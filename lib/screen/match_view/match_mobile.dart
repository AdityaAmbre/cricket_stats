part of 'match_view.dart';

class MatchMobile extends StatelessWidget {
  final MatchViewModel viewModel;

  const MatchMobile(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context, viewModel),
      body: _body(context, viewModel),
    );
  }

  AppBar _appBar(BuildContext context, MatchViewModel viewModel) {
    return AppBar(
      leading: InkWell(
        onTap: () => viewModel.onMenuClick(),
        child: Icon(
          Icons.menu,
          color: ResColors.white
        ),
      ),
      title: Text(
        Constant.matchPage,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: ResColors.white),
        overflow: TextOverflow.visible,
      ),
      backgroundColor: ResColors.primary,
      actions: [
        IconButton(
          icon: Icon(Icons.info_outlined, color: ResColors.white),
          onPressed: () {
            CustomAlertDialog.showAlertDialog(
              context: context,
              title: "About",
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("Cricket Stats - (1.0.0)", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        const SizedBox(width: 20),
                        Icon(
                          Icons.sports_cricket_sharp,
                          size: 30,
                          color: ResColors.iconColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                    const Text("Designed & Developed by, Aditya Ambre.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                      ),),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => Util.openUrl("https://github.com/AdityaAmbre"),
                      child: const Text.rich(
                        TextSpan(
                          text: "• GitHub Profile: ",
                          style: TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                              text: "Aditya Ambre",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () => Util.openUrl("https://github.com/AdityaAmbre/cricket_stats"),
                      child: const Text.rich(
                        TextSpan(
                          text: "• GitHub Project: ",
                          style: TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                              text: "Source Code",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () => Util.openUrl("https://github.com/AdityaAmbre/cricket_stats/blob/main/LICENSE"),
                      child: const Text.rich(
                        TextSpan(
                          text: "• Copyrights: ",
                          style: TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                              text: "Apache License 2.0",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 30),
                    const Text("Demo APIs",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => Util.openUrl("https://demo.sportz.io/nzin01312019187360.json"),
                      child: const Text.rich(
                        TextSpan(
                          text: "• API - 1: ",
                          style: TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                              text: "\nhttps://demo.sportz.io/nzin01312019187360.json",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () => Util.openUrl("https://demo.sportz.io/sapk01222019186652.json"),
                      child: const Text.rich(
                        TextSpan(
                          text: "• API - 2: ",
                          style: TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                              text: "\nhttps://demo.sportz.io/sapk01222019186652.json",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () => Get.back(),
              buttonText: "EXIT",
            );
          },
        ),
      ],
    );
  }

  Widget _body(BuildContext context, MatchViewModel viewModel) {
    return Container(
      color: ResColors.white,
      width: double.infinity,
      child: ListView.builder(
        itemCount: viewModel.cricketModelApiList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            child: Card(
              elevation: 6.0,
              child: ExpansionTile(
                tilePadding: const EdgeInsets.all(0),
                shape: Border.all(style: BorderStyle.none),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.sports_cricket_sharp, size: 30, color: ResColors.iconColor),
                                const SizedBox(width: 10),
                                Text(
                                  "Match: ${viewModel.cricketModelApiList[index]?.matchdetail?.match?.type ?? ""}",
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.visible,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "(${viewModel.cricketModelApiList[index]?.matchdetail?.match?.league?.toUpperCase() ?? ""})",
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              viewModel.cricketModelApiList[index]?.teams[viewModel.cricketModelApiList[index]?.matchdetail?.teamAway]?.nameFull ?? "",
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          Icon(Icons.compare_arrows_sharp, color: ResColors.iconColor),
                          Flexible(
                            child: Text(
                              viewModel.cricketModelApiList[index]?.teams[viewModel.cricketModelApiList[index]?.matchdetail?.teamHome]?.nameFull ?? "",
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: ResColors.iconColor),
                                const SizedBox(width: 02),
                                Text(
                                  viewModel.cricketModelApiList[index]?.matchdetail?.venue?.name ?? "",
                                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.date_range, color: ResColors.iconColor),
                              const SizedBox(width: 02),
                              Text(
                                viewModel.cricketModelApiList[index]?.matchdetail?.match?.date ?? "",
                                style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                          const Text("|", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                          Row(
                            children: [
                              Icon(Icons.access_time, color: ResColors.iconColor),
                              const SizedBox(width: 02),
                              Text(
                                viewModel.cricketModelApiList[index]?.matchdetail?.match?.time ?? "",
                                style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Miscellaneous", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.visible),
                      ),
                      displayRow(
                        key: "Weather",
                        value: viewModel.cricketModelApiList[index]?.matchdetail?.weather ?? "",
                      ),
                      displayRow(
                        key: "Status",
                        value: viewModel.cricketModelApiList[index]?.matchdetail?.status ?? "",
                      ),
                      displayRow(
                        key: "Player Match",
                        value: viewModel.cricketModelApiList[index]?.matchdetail?.playerMatch ?? "",
                      ),
                      displayRow(
                        key: "Result",
                        value: viewModel.cricketModelApiList[index]?.matchdetail?.result ?? "",
                      ),
                      const Divider(thickness: 0.5),
                      /// Match Detail
                      ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        shape: Border.all(style: BorderStyle.none),
                        title: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Match Detail", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                            overflow: TextOverflow.visible),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Match", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.visible),
                                  displayRow(key: "• LiveCoverage", value: viewModel.cricketModelApiList[index]?.matchdetail?.match?.livecoverage ?? ""),
                                  displayRow(key: "• Code", value: viewModel.cricketModelApiList[index]?.matchdetail?.match?.code ?? ""),
                                  displayRow(key: "• League", value: viewModel.cricketModelApiList[index]?.matchdetail?.match?.league ?? ""),
                                  displayRow(key: "• Type", value: viewModel.cricketModelApiList[index]?.matchdetail?.match?.type ?? ""),
                                  displayRow(key: "• Number", value: viewModel.cricketModelApiList[index]?.matchdetail?.match?.number ?? ""),
                                  displayRow(key: "• Offset", value: viewModel.cricketModelApiList[index]?.matchdetail?.match?.offset ?? ""),
                                  displayRow(key: "• Day Night", value: viewModel.cricketModelApiList[index]?.matchdetail?.match?.daynight ?? ""),
                                  const SizedBox(height: 10),
                                  const Text("Series", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.visible),
                                  displayRow(key: "• Name", value: viewModel.cricketModelApiList[index]?.matchdetail?.series?.name ?? ""),
                                  displayRow(key: "• Status", value: viewModel.cricketModelApiList[index]?.matchdetail?.series?.status ?? ""),
                                  displayRow(key: "• Tour Name", value: viewModel.cricketModelApiList[index]?.matchdetail?.series?.tourName ?? ""),
                                  const SizedBox(height: 10),
                                  const Text("Officials", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.visible),
                                  displayRow(key: "• Umpires", value: viewModel.cricketModelApiList[index]?.matchdetail?.officials?.umpires ?? ""),
                                  displayRow(key: "• Referee", value: viewModel.cricketModelApiList[index]?.matchdetail?.officials?.referee ?? ""),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      /// Innings
                      ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        shape: Border.all(style: BorderStyle.none),
                        title: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Innings", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.visible),
                        ),
                        children: [
                          ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: viewModel.cricketModelApiList[index]?.innings.length ?? 0,
                          itemBuilder: (context, inningIndex) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Inning ${inningIndex+1}:", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.visible),
                                    displayRow(key: "• Number", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].number ?? ""),
                                    displayRow(key: "• Batting Team", value: viewModel.cricketModelApiList[index]?.matchdetail?.teamAway ?? ""),
                                    displayRow(key: "• Total", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].total ?? ""),
                                    displayRow(key: "• Wickets", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].wickets ?? ""),
                                    displayRow(key: "• Overs", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].overs ?? ""),
                                    displayRow(key: "• Run Rate", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].runrate ?? ""),
                                    displayRow(key: "• Byes", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].byes ?? ""),
                                    displayRow(key: "• Leg Byes", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].legbyes ?? ""),
                                    displayRow(key: "• Wides", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].wides ?? ""),
                                    displayRow(key: "• No Balls", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].noballs ?? ""),
                                    displayRow(key: "• Penalty", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].penalty ?? ""),
                                    displayRow(key: "• Allotted Overs", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].allottedOvers ?? ""),
                                    const SizedBox(height: 05),
                                    const Divider(thickness: 0.5),
                                    const SizedBox(height: 05),
                                    const Text("Batsmen", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.visible),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen.length ?? 0,
                                      itemBuilder: (context, batsmanIndex) {
                                        return ListTile(
                                          title: Text('• Batsman: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen[batsmanIndex].batsman}'),
                                          subtitle: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Runs: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen[batsmanIndex].runs}'),
                                              Text('Balls: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen[batsmanIndex].balls}'),
                                              Text('Fours: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen[batsmanIndex].fours}'),
                                              Text('Dots: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen[batsmanIndex].dots}'),
                                              Text('Strikerate: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen[batsmanIndex].strikerate}'),
                                              Text('Dismissal: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen[batsmanIndex].dismissal}'),
                                              Text('Howout: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen[batsmanIndex].howout}'),
                                              Text('Bowler: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen[batsmanIndex].bowler}'),
                                              Text('Fielder: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen[batsmanIndex].fielder}'),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 05),
                                    const Divider(thickness: 0.25),
                                    const SizedBox(height: 05),
                                    const Text("Partnership Current", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.visible),
                                    displayRow(key: "• Runs", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].partnershipCurrent?.runs ?? ""),
                                    displayRow(key: "• Balls", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].partnershipCurrent?.balls ?? ""),
                                    const SizedBox(height: 05),
                                    const Divider(thickness: 0.25),
                                    const SizedBox(height: 05),
                                    const Text("Bowlers", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.visible),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: viewModel.cricketModelApiList[index]?.innings[inningIndex].bowlers.length ?? 0,
                                      itemBuilder: (context, bowlersIndex) {
                                        return ListTile(
                                          title: Text('• Bowlers: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].batsmen[bowlersIndex].bowler}'),
                                          subtitle: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Bowler: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].bowlers[bowlersIndex].bowler}'),
                                              Text('Overs: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].bowlers[bowlersIndex].overs}'),
                                              Text('Maidens: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].bowlers[bowlersIndex].maidens}'),
                                              Text('Runs: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].bowlers[bowlersIndex].runs}'),
                                              Text('Wickets: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].bowlers[bowlersIndex].wickets}'),
                                              Text('Economyrate: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].bowlers[bowlersIndex].economyrate}'),
                                              Text('Noballs: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].bowlers[bowlersIndex].noballs}'),
                                              Text('Wides: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].bowlers[bowlersIndex].wides}'),
                                              Text('Dots: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].bowlers[bowlersIndex].dots}'),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 05),
                                    const Divider(thickness: 0.25),
                                    const SizedBox(height: 05),
                                    const Text("Fall of Wickets", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.visible),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: viewModel.cricketModelApiList[index]?.innings[inningIndex].fallofWickets.length ?? 0,
                                      itemBuilder: (context, fallOfWicketsIndex) {
                                        return ListTile(
                                          title: Text('• Batsman: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].fallofWickets[fallOfWicketsIndex].batsman}'),
                                          subtitle: Text('Score: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].fallofWickets[fallOfWicketsIndex].score}, Overs: ${viewModel.cricketModelApiList[index]?.innings[inningIndex].fallofWickets[fallOfWicketsIndex].score}'),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 05),
                                    const Divider(thickness: 0.25),
                                    const SizedBox(height: 05),
                                    const Text("Power Play", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.visible),
                                    displayRow(key: "• PP1", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].powerPlay?.pp1 ?? ""),
                                    displayRow(key: "• PP2", value: viewModel.cricketModelApiList[index]?.innings[inningIndex].powerPlay?.pp2 ?? ""),
                                    const SizedBox(height: 10),
                                    const Divider(thickness: 1.0),
                                  ],
                                ),
                              ),
                            );
                          },),
                        ],
                      ),
                      /// Nuggets
                      ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        shape: Border.all(style: BorderStyle.none),
                        title: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Nuggets", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.visible),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: viewModel.cricketModelApiList[index]?.nuggets.length ?? 0,
                              itemBuilder: (context, nuggetsIndex) {
                                return displayRow(key: ":", value: viewModel.cricketModelApiList[index]?.nuggets[nuggetsIndex] ?? "");
                              },
                            ),
                          ),
                        ],
                      ),
                      /// Notes
                      ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        shape: Border.all(style: BorderStyle.none),
                        title: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Notes", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.visible),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: viewModel.cricketModelApiList[index]?.notes.length,
                              itemBuilder: (context, index) {
                                String key = viewModel.cricketModelApiList[index]?.notes.keys.elementAt(index) ?? "";
                                List<String> noteList = viewModel.cricketModelApiList[index]?.notes[key] as List<String>;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("$key", style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.visible),
                                    const SizedBox(height:05),
                                    Column(
                                      children: noteList.map((note) {
                                        return ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.zero,
                                          title: displayRow(key: ":", value: note),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      /// Re-direct to next screen
                      const Divider(thickness: 0.5),
                      const SizedBox(height: 5.0),
                      viewTeamsButton(index),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget displayRow({required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
              child: Text(
                "$key: $value",
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget viewTeamsButton(int index) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
        child: ElevatedButton(
          onPressed: () => viewModel.redirectToNextPage(index),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(ResColors.primary),
            foregroundColor: WidgetStateProperty.all(ResColors.white),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("VIEW TEAMS", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward_sharp),
            ],
          ),
        ),
      ),
    );
  }
}