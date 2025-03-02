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
        Constant.appName,
        style: TextStyle(color: ResColors.white),
      ),
      backgroundColor: ResColors.primary,
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
                      const Divider(thickness: 0.25),
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
}