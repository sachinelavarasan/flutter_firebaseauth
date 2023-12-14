import "package:demo_app/features/authentication/screens/forgot_password/forgot_password.dart";
import "package:demo_app/features/authentication/screens/signin/signin.dart";
import "package:demo_app/features/authentication/controllers/login/login_controller.dart";
import "package:flutter/material.dart";
import "package:demo_app/utils/validators/validators.dart";
import "package:get/get.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 56.0, right: 24.0, left: 24.0, bottom: 24.0),
          child: Column(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage("assets/icons/shopping_trolley.png"),
                    height: 100,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Welcome Back,",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Click, Shop, Smile: Your Ultimate Ecommerce Experience",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Form(
                    key: controller.loginFormKey,
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
                          height: 10.0,
                        ),
                        Obx(
                          () => TextFormField(
                            controller: controller.password,
                            validator: (value) => Validators.validateTextEmpty(
                                value!, "Password"),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.password_outlined),
                              labelText: "Password",
                              suffixIcon: IconButton(
                                onPressed: () => controller.hidePassword.value =
                                    !controller.hidePassword.value,
                                icon: Icon(controller.hidePassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                              ),
                            ),
                            cursorColor: Colors.blue,
                            obscureText: controller.hidePassword.value,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(
                                  () => Checkbox(
                                    value: controller.rememberMe.value,
                                    onChanged: (value) => controller.rememberMe
                                        .value = !controller.rememberMe.value,
                                    activeColor: Colors.blue,
                                  ),
                                ),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            TextButton(
                                onPressed: () =>
                                    Get.to(const ForgotPasswordScreen()),
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Obx(
                          () => SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => controller.isLoading.value
                                  ? null
                                  : controller.login(),
                              child: !controller.isLoading.value
                                  ? const Text("Sign In")
                                  : const SizedBox(
                                      height: 20.0,
                                      width: 20.0,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                Get.offAll(const SignInScreen());
                              },
                              child: const Text("Create Account",
                                  style: TextStyle(color: Colors.black)),
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Divider(
                      color: Colors.deepPurple[50],
                      thickness: 0.5,
                      endIndent: 5,
                      indent: 60,
                    ),
                  ),
                  const Text(
                    "Or Sign In With",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Flexible(
                    child: Divider(
                      color: Colors.deepPurple[50],
                      thickness: 0.5,
                      endIndent: 60,
                      indent: 5,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40)),
                    child: TextButton(
                        onPressed: () => controller.googleSignIn(),
                        child: Image.asset(
                          'assets/icons/google.png',
                          width: 40,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
