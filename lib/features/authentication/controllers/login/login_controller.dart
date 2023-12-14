import "package:demo_app/data/repositories/authentications/authentication_repository.dart";
import "package:demo_app/data/repositories/user/user_repository.dart";
import "package:demo_app/features/authentication/models/user_model.dart";
import "package:demo_app/features/personalisation/controllers/user_controller.dart";
import "package:demo_app/utils/loaders.dart";
import "package:demo_app/utils/network_connectivity.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";

class LogInController extends GetxController {
  static LogInController get instance => Get.find();

  final storage = GetStorage();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final isLoading = false.obs;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = storage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = storage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  Future<void> login() async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      if (rememberMe.value) {
        storage.write("REMEMBER_ME_EMAIL", email.text.trim());
        storage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailPassword(email.text.trim(), password.text.trim());

      final namePart =
          UserModel.nameParts(userCredential.user!.displayName ?? '');
      final username =
          UserModel.generateUserName(userCredential.user!.displayName ?? '');

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: namePart[0],
        lastName: namePart.length > 1 ? namePart.sublist(1).join(' ') : '',
        username: username,
        email: userCredential.user!.email ?? '',
        phoneNumber: userCredential.user!.phoneNumber ?? '',
        profilePicture: userCredential.user!.photoURL ?? '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      isLoading.value = false;
      AuthenticationRepository.instance.screenRedirection();
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh Snap!", message: e.toString());
      isLoading.value = false;
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
