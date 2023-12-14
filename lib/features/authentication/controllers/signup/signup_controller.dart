import "package:demo_app/data/repositories/authentications/authentication_repository.dart";
import "package:demo_app/data/repositories/user/user_repository.dart";
import "package:demo_app/features/authentication/models/user_model.dart";
import "package:demo_app/features/authentication/screens/verifyemail/verify_email.dart";
import "package:demo_app/features/personalisation/controllers/user_controller.dart";
import "package:demo_app/utils/loaders.dart";
import "package:demo_app/utils/network_connectivity.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final hidePassword = true.obs;
  final isLoading = false.obs;
  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pNumber = TextEditingController();
  final TextEditingController password = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      if (!signUpFormKey.currentState!.validate()) {
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: fName.text.trim(),
        lastName: lName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: pNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      isLoading.value = false;
      Loaders.successSnackbar(
          title: "Congratulation!",
          message:
              "Your account has been created.Please verify your email account");

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      isLoading.value = false;
      Loaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
    // validate all the form fields
  }

  Future<void> googleSignIn() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      final userController = Get.put(UserController());
      await userController.saveUserRecord(userCredential);

      AuthenticationRepository.instance.screenRedirection();
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
    // validate all the form fields
  }
}
