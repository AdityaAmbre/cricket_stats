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
        child: const Icon(
          Icons.menu,
          color: Colors.white
        ),
      ),
      title: const Text(
        Constant.appName,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
  }

  Widget _body(BuildContext context, MatchViewModel viewModel) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: ListView.builder(
        itemCount: viewModel.cricketModelApiList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            child: Card(
              elevation: 6.0,
              child: ExpansionTile(
                tilePadding: const EdgeInsets.all(0), // Remove padding
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
                            child: Text(
                              "Match: ${viewModel.cricketModelApiList[index]?.matchdetail?.match?.type ?? ""}",
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                              overflow: TextOverflow.visible,
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
                          const Text("v/s", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
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
                            child: Text(
                              "Location: ${viewModel.cricketModelApiList[index]?.matchdetail?.venue?.name ?? ""}",
                              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.visible,
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
                              "Date: ${viewModel.cricketModelApiList[index]?.matchdetail?.match?.date ?? ""}",
                              style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          const Text("|", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                          Flexible(
                            child: Text(
                              "Time: ${viewModel.cricketModelApiList[index]?.matchdetail?.match?.time ?? ""}",
                              style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.visible,
                            ),
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
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Miscellaneous", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.visible,),
                      ),
                      displayRow(
                        key: "Weather",
                        value: viewModel.cricketModelApiList[index]?.matchdetail?.weather ?? "",
                      ),
                      displayRow(
                        key: "Status",
                        value: viewModel.cricketModelApiList[index]?.matchdetail?.series?.status ?? "",
                      ),
                      displayRow(
                        key: "Tour",
                        value: viewModel.cricketModelApiList[index]?.matchdetail?.series?.tourName ?? "",
                      ),
                      displayRow(
                        key: "Series",
                        value: viewModel.cricketModelApiList[index]?.matchdetail?.series?.name ?? "",
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
              padding: const EdgeInsets.all(4.0),
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