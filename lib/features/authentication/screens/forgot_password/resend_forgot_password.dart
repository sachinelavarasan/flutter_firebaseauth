import "package:demo_app/features/authentication/controllers/reset_password/reset_password_controller.dart";
import "package:demo_app/features/authentication/screens/login/login.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class ResendForgotPasswordScreen extends StatelessWidget {
  const ResendForgotPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(const LoginScreen()),
              icon: const Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/icons/shopping_trolley.png"),
                    height: 100,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Pasword Reset Email Sent",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.offAll(const LoginScreen());
                            },
                            child: const Text("Done"),
                          )),
                      TextButton(
                          onPressed: () {
                            controller.reSendPasswordResetEmail(email);
                          },
                          child: const Text(
                            "Resend Email",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
