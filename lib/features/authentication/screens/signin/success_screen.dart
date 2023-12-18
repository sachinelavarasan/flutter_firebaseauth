import 'package:flutter/material.dart';
import 'package:demo_app/utils/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(
                top: 50.0, right: 24.0, left: 24.0, bottom: 24.0),
            child: Center(
              child: Column(
                children: [
                  Image(
                      width: HelperFunctions.screenWidth() * 0.6,
                      image: AssetImage(image)),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onPressed,
                        child: const Text("Continue"),
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
