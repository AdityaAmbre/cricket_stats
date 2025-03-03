part of 'team_view.dart';

class TeamMobile extends StatelessWidget {
  final TeamViewModel viewModel;

  const TeamMobile(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context, viewModel),
      body: _body(context, viewModel),
    );
  }

  AppBar _appBar(BuildContext context, TeamViewModel viewModel) {
    return AppBar(
      leading: InkWell(
        onTap: () => viewModel.onBackClick(),
        child: Icon(
            Icons.arrow_back_sharp,
            color: ResColors.white
        ),
      ),
      title: Text(
        Constant.teamsPage,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: ResColors.white),
        overflow: TextOverflow.visible,
      ),
      backgroundColor: ResColors.primary,
    );
  }

  Widget _body(BuildContext context, TeamViewModel viewModel) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ResColors.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.sports_cricket_sharp, size: 30, color: ResColors.white),
                                const SizedBox(width: 10),
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    "Match: ${viewModel.cricketModelApiList[viewModel.selectedIndex]?.matchdetail?.match?.type ?? ""}",
                                    style: TextStyle(color: ResColors.white, fontSize: 20, fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    "(${viewModel.cricketModelApiList[viewModel.selectedIndex]?.matchdetail?.match?.league?.toUpperCase() ?? ""})",
                                    style: TextStyle(color: ResColors.white, fontSize: 20, fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => viewModel.onTapTeamSelection(0),
                    child: Card(
                      elevation: 4.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: viewModel.isTeamASelected
                              ? const Color.fromARGB(255, 83, 155, 83) : const Color.fromARGB(125, 200, 200, 200),
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        height: MediaQuery.of(context).size.width*0.40,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(viewModel.cricketModelApiList[viewModel.selectedIndex]
                                    ?.teams[viewModel.cricketModelApiList[viewModel.selectedIndex]
                                    ?.matchdetail?.teamAway]?.nameFull ?? "",
                                    style: TextStyle(
                                        color: viewModel.isTeamASelected
                                            ? ResColors.white : const Color.fromARGB(250, 45, 45, 45),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600
                                    ),
                                    overflow: TextOverflow.visible
                                ),
                                const SizedBox(height: 10),
                                Text("(${viewModel.cricketModelApiList[viewModel.selectedIndex]
                                    ?.teams[viewModel.cricketModelApiList[viewModel.selectedIndex]
                                    ?.matchdetail?.teamAway]?.nameShort ?? ""})",
                                    style: TextStyle(
                                        color: viewModel.isTeamASelected
                                            ? ResColors.white : const Color.fromARGB(250, 45, 45, 45),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                    ),
                                    overflow: TextOverflow.visible
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Icon(Icons.compare_arrows_sharp, color: ResColors.iconColor),
                const SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () => viewModel.onTapTeamSelection(1),
                    child: Card(
                      elevation: 4.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: viewModel.isTeamBSelected
                              ? const Color.fromARGB(255, 83, 155, 83) : const Color.fromARGB(125, 200, 200, 200),
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        height: MediaQuery.of(context).size.width*0.40,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(viewModel.cricketModelApiList[viewModel.selectedIndex]
                                  ?.teams[viewModel.cricketModelApiList[viewModel.selectedIndex]
                                  ?.matchdetail?.teamHome]?.nameFull ?? "",
                                  style: TextStyle(
                                    color: viewModel.isTeamBSelected
                                        ? ResColors.white : const Color.fromARGB(250, 45, 45, 45),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600
                                  ),
                                  overflow: TextOverflow.visible
                                ),
                                const SizedBox(height: 10),
                                Text("(${viewModel.cricketModelApiList[viewModel.selectedIndex]
                                    ?.teams[viewModel.cricketModelApiList[viewModel.selectedIndex]
                                    ?.matchdetail?.teamHome]?.nameShort ?? ""})",
                                    style: TextStyle(
                                      color: viewModel.isTeamBSelected
                                          ? ResColors.white : const Color.fromARGB(250, 45, 45, 45),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                    ),
                                    overflow: TextOverflow.visible
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ResColors.primary,
                        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.group, size: 30, color: ResColors.white),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Team Players",
                                style: TextStyle(color: ResColors.white, fontSize: 20, fontWeight: FontWeight.w600),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: SizedBox(
                      height: constraints.maxHeight,
                      child: ListView.builder(
                        itemCount: viewModel.teamMap![viewModel.isTeamASelected
                            ? viewModel.cricketModelApiList[viewModel.selectedIndex]?.matchdetail?.teamHome
                            : viewModel.cricketModelApiList[viewModel.selectedIndex]?.matchdetail?.teamAway
                        ]?.players.length ?? 0,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            viewModel.players.clear();
                            viewModel.mapTeams();
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 4.0,
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: constraints.maxWidth * 0.95,
                                ),
                                decoration: BoxDecoration(
                                  color: ResColors.white,
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: ListTile(
                                  leading: Icon(Icons.person, size: 30, color: ResColors.primary),
                                  onTap: () => viewModel.showAlertDialog(context, index, viewModel.players[index].nameFull ?? "-"),
                                  title: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${viewModel.players[index].nameFull ?? "-"}"
                                              " ${viewModel.players[index].iscaptain ?? false ? "(Captain)" : ""}",
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text("Position: ${viewModel.players[index].position ?? "-"}"),
                                  trailing: Text(viewModel.players[index].iskeeper ?? false ? "(Wicket-Keeper)" : "",
                                    style: const TextStyle(fontStyle: FontStyle.italic),),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}