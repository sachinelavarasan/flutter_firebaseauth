import "package:demo_app/data/repositories/authentications/authentication_repository.dart";
import "package:demo_app/features/authentication/screens/forgot_password/resend_forgot_password.dart";

import "package:demo_app/utils/loaders.dart";
import "package:demo_app/utils/network_connectivity.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance => Get.find();

  final TextEditingController email = TextEditingController();

  final isLoading = false.obs;

  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      if (!resetPasswordFormKey.currentState!.validate()) {
        return;
      }
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      Loaders.successSnackbar(
          title: "Email Sent",
          message: "Please check your inbox and setup your new password");
      isLoading.value = false;
      Get.offAll(ResendForgotPasswordScreen(email: email.text.trim()));
    } catch (e) {
      isLoading.value = false;
      Loaders.errorSnackbar(title: "Oh snap!", message: e);
    }
  }

  reSendPasswordResetEmail(String email) async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      Loaders.successSnackbar(
          title: "Email Sent",
          message: "Please check your inbox and setup your new password");
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap!", message: e.toString());
    }
  }
}
