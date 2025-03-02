library splash_view;

import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/res/res_colors.dart';
import 'package:cricket_stats/constant/constant.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:cricket_stats/screen/splash_view/splash_view_model.dart';

part 'splash_mobile.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SplashViewModel(context),
        onViewModelReady: (viewModel) {
          viewModel.init();
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout.builder(
            mobile: (context) => SplashMobile(viewModel),
          );
        },
    );
  }
}