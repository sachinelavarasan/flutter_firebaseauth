import 'package:demo_app/data/repositories/authentications/authentication_repository.dart';
import 'package:demo_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import "package:demo_app/features/authentication/controllers/signup/verify_email_controller.dart";

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logOut(),
              icon: const Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, right: 24.0, left: 24.0, bottom: 24.0),
        child: Center(
          child: Column(
            children: [
              Image(
                  width: HelperFunctions.screenWidth() * 0.6,
                  image: const AssetImage("assets/icons/confirm.png")),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Verify your email address!",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
              ),
              Text(
                email ?? "",
                style: const TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "This involves confirming the identity of individuals creating accounts on an e-commerce platform. Methods may include email verification.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.checkEmailVerificationStatus();
                    },
                    child: const Text("Continue"),
                  )),
              TextButton(
                onPressed: () => controller.sendEmailVerification(),
                child: const Text(
                  "Resend Email",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
