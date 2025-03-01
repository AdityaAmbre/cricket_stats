library team_view;

import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/constant/constant.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:cricket_stats/screen/team_view/team_view_model.dart';

part 'team_mobile.dart';

class TeamView extends StatelessWidget {
  const TeamView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TeamViewModel(context),
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (context) => TeamMobile(viewModel),
        );
      },
    );
  }
}