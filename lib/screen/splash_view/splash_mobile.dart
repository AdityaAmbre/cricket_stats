part of 'splash_view.dart';

class SplashMobile extends StatelessWidget {
  final SplashViewModel viewModel;

  const SplashMobile(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context, viewModel),
    );
  }

  Widget _body(BuildContext context, SplashViewModel viewModel) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.sports_cricket_sharp,
            color: Colors.white,
            size: 120,
            shadows: [Shadow(color: Colors.black26, offset: Offset(-4, 4))],
          ),
          const SizedBox(height: 25),
          const Text(
            Constant.appName,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: 27,
              shadows: [Shadow(color: Colors.black26, offset: Offset(2, -2))],
            ),
          ),
          const SizedBox(height: 50),
          viewModel.isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}