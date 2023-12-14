import 'package:demo_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image(
              width: HelperFunctions.screenWidth() * 0.8,
              height: HelperFunctions.screenHeight() * 0.6,
              image: AssetImage(image)),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
