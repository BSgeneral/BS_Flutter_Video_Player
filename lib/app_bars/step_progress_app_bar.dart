import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepProgressAppBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final String progressText;

  const StepProgressAppBar({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    required this.progressText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
