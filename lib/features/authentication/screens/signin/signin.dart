import "package:demo_app/features/authentication/controllers/signup/signup_controller.dart";
import "package:demo_app/features/authentication/screens/login/login.dart";
import "package:demo_app/utils/validators/validators.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 50.0, right: 24.0, left: 24.0, bottom: 24.0),
          child: Column(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create your account",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Form(
                    key: controller.signUpFormKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controller.fName,
                                validator: (value) =>
                                    Validators.validateTextEmpty(
                                        value, "First name"),
                                expands: false,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.attribution_outlined),
                                  labelText: "First Name",
                                ),
                                cursorColor: Colors.blue,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: controller.lName,
                                validator: (value) =>
                                    Validators.validateTextEmpty(
                                        value, "Last name"),
                                expands: false,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.attribution_outlined),
                                  labelText: "Last Name",
                                ),
                                cursorColor: Colors.blue,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: controller.userName,
                          validator: (value) =>
                              Validators.validateUserName(value!),
                          expands: false,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "Username",
                          ),
                          cursorColor: Colors.blue,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
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
                        TextFormField(
                          controller: controller.pNumber,
                          validator: (value) =>
                              Validators.validatePhoneNumber(value!),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: "Phone Number",
                          ),
                          cursorColor: Colors.blue,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Obx(
                          () => TextFormField(
                            controller: controller.password,
                            validator: (value) =>
                                Validators.validatePassword(value!),
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
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => controller.isLoading.value
                                ? null
                                : controller.signup(),
                            child: !controller.isLoading.value
                                ? const Text("Sign Up")
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: TextButton(
                                onPressed: () {
                                  Get.offAll(const LoginScreen());
                                },
                                child: const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ))),
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
                    "Or Sign Up With",
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
