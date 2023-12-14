import 'package:flutter/material.dart';
import 'package:demo_app/features/authentication/controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      right: 16.0,
      bottom: 70,
      child: ElevatedButton(
        onPressed: () => controller.nextPage(),
        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
        child: const Icon(
          Icons.arrow_right_alt,
          color: Colors.white,
        ),
      ),
    );
  }
}
