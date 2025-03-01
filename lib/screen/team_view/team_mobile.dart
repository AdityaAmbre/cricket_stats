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
      title: const Text(Constant.appName),
    );
  }

  Widget _body(BuildContext context, TeamViewModel viewModel) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.sports_cricket_sharp,
            size: 100,
            color: Colors.white,
          ),
          SizedBox(height: 25),
          Text(
            Constant.appName,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}