import 'package:bs_reusable_widgets/app_bars/step_progress_app_bar.dart';
import 'package:bs_reusable_widgets/app_bars/title_plain_app_bar.dart';
import 'package:flutter/material.dart';

class AppBars extends StatelessWidget {
  const AppBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: CustomScrollView(
      slivers: [
        const StepProgressAppBar(
            title: 'Step Progress Title',
            subTitle: 'Sub Title',
            totalSteps: 3,
            currentStep: 1,
            progressText: 'Progress Text'),

        TitlePlainAppBar(
            title: 'Plain title',
            appBarIcon: const Icon(
              Icons.edit,
            ),
            onAppBarIconTapped: () {
              print('App Bar Icon Pressed');
            },
            isTitleHasTwoLines: true),

      ],
    ));
  }
}
