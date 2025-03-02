library team_view;

import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/res/res_colors.dart';
import 'package:cricket_stats/constant/constant.dart';
import 'package:cricket_stats/model/cricket_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:cricket_stats/screen/team_view/team_view_model.dart';

part 'team_mobile.dart';

class TeamView extends StatelessWidget {
  final List<CricketModel?> cricketModelApiList;
  final int selectedIndex;

  const TeamView(this.cricketModelApiList, this.selectedIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TeamViewModel(context, cricketModelApiList, selectedIndex),
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