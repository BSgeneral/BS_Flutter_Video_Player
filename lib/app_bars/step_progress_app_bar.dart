import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepProgressAppBar extends StatelessWidget {
  final String title;
  final String subTitle;
  final int totalSteps;
  final int currentStep;
  final String progressText;

  const StepProgressAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.totalSteps,
    required this.currentStep,
    required this.progressText,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      automaticallyImplyLeading: false,
      expandedHeight: 220.0,
      collapsedHeight: 160.0,
      elevation: 0.0,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  progressText,
                  style: const TextStyle(
                      color: Color(0xff182A39),
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            StepProgressIndicator(
              totalSteps: totalSteps,
              currentStep: currentStep,
              size: 4,
              padding: 0,
              selectedColor: const Color(0xFFFFA0A0),
              unselectedColor: const Color(0xFFD9D9D9),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                title,
                style: const TextStyle(
                    color: Color(0xFF253861),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                subTitle,
                style: const TextStyle(
                    color: Color(0xFF808191),
                    fontSize: 11.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        titlePadding:  const EdgeInsetsDirectional.only(
          start: 0,
          end: 0,
          bottom: 25,
        ),
        centerTitle: false,
        stretchModes:  [],
      ),
    );
  }
}
