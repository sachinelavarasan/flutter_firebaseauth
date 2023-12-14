import "dart:async";

import "package:demo_app/data/repositories/authentications/authentication_repository.dart";
import "package:demo_app/features/authentication/controllers/signup/success_screen.dart";
import "package:demo_app/utils/loaders.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:get/get.dart";

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();

      Loaders.successSnackbar(
          title: "Email Sent",
          message: "Please check your inbox and verify your email");
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap!", message: e);
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: "assets/icons/approved.png",
              subtitle: "Now you are up!.Just try to get expericed in this app",
              title: "Account verified",
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirection(),
            ));
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: "assets/icons/approved.png",
            subtitle: "Now you are up!.Just try to get expericed in this app",
            title: "Account verified",
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirection(),
          ));
    }
  }
}
