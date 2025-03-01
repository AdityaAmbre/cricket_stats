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
      title: const Text(Constant.appName),
    );
  }

  Widget _body(BuildContext context, MatchViewModel viewModel) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: const Center(child: Text(Constant.appName)),
    );
  }
}