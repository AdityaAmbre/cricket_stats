library match_view;

import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:cricket_stats/res/res_colors.dart';
import 'package:cricket_stats/constant/constant.dart';
import 'package:cricket_stats/model/cricket_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:cricket_stats/screen/match_view/match_view_model.dart';

part 'match_mobile.dart';

class MatchView extends StatelessWidget {
  final List<CricketModel?> cricketModelApiList;

  const MatchView(this.cricketModelApiList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MatchViewModel(context, cricketModelApiList),
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