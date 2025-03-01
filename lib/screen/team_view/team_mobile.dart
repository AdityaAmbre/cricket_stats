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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => viewModel.onTapTeamSelection(0),
                  child: Container(
                    // color: Colors.red,
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
              const SizedBox(width: 10),
              Icon(Icons.compare_arrows_sharp, color: ResColors.iconColor),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () => viewModel.onTapTeamSelection(1),
                  child: Container(
                    // color: Colors.red,
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
            ],
          ),
        ],
      ),
    );
  }
}