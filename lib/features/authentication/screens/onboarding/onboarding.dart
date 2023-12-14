import 'package:demo_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:demo_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:flutter/material.dart';

import 'package:demo_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:demo_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:demo_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBoardingPage(
              image: "assets/images/onboarding_images/shopping_options.gif",
              title: "Choose your product",
              subTitle:
                  "Anything that you need now it is availble with in some clicks",
            ),
            OnBoardingPage(
              image: "assets/images/onboarding_images/packaging_delivery.gif",
              title: "Safe package Delivery",
              subTitle:
                  "Anything that you need now it is availble with in some clicks",
            ),
            OnBoardingPage(
              image: "assets/images/onboarding_images/delivery_boy.gif",
              title: "Delivery at your door step",
              subTitle:
                  "Anything that you need now it is availble with in some clicks",
            ),
          ],
        ),
        const OnBoardingSkip(),
        const OnBoardingDotNavigator(),
        const OnBoardingNextButton()
      ],
    ));
  }
}
