import "package:demo_app/features/authentication/controllers/reset_password/reset_password_controller.dart";
import "package:demo_app/features/authentication/screens/login/login.dart";
import "package:flutter/material.dart";
import "package:demo_app/utils/validators/validators.dart";
import "package:get/get.dart";

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/icons/shopping_trolley.png"),
                    height: 100,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Forgot Password",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Form(
                    key: controller.resetPasswordFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.email,
                          validator: (value) =>
                              Validators.validateEmail(value!),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Email",
                          ),
                          cursorColor: Colors.blue,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => controller.isLoading.value
                                  ? null
                                  : controller.sendPasswordResetEmail(),
                              child: !controller.isLoading.value
                                  ? const Text("Continue")
                                  : const SizedBox(
                                      height: 20.0,
                                      width: 20.0,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                            )),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
