import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:demo_app/features/authentication/controllers/onboarding/onboarding_controller.dart';

class OnBoardingDotNavigator extends StatelessWidget {
  const OnBoardingDotNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: 90,
      left: 16.0,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: controller.dotNavigationClick,
        effect: const ExpandingDotsEffect(
            activeDotColor: Colors.black87, dotHeight: 6),
      ),
    );
  }
}
