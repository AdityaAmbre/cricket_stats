library match_view;

import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/constant/constant.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:cricket_stats/screen/match_view/match_view_model.dart';

part 'match_mobile.dart';

class MatchView extends StatelessWidget {
  const MatchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MatchViewModel(context),
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (context) => MatchMobile(viewModel),
        );
      },
    );
  }
}