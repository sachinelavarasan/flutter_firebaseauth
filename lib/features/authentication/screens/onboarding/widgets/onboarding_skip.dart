import 'package:demo_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:demo_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
        top: HelperFunctions.getStatusBarHeight(),
        right: 0.0,
        child: TextButton(
            onPressed: () => controller.skipPage(),
            child: const Text(
              "Skip",
              style: TextStyle(fontSize: 14, color: Colors.black),
            )));
  }
}
