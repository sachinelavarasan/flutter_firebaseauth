import 'package:demo_app/data/repositories/user/user_repository.dart';
import 'package:demo_app/features/authentication/models/user_model.dart';
import 'package:demo_app/utils/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  Rx<bool> profileLoading = false.obs;

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchCurrentUser();
  }

  Future<void> fetchCurrentUser() async {
    try {
      profileLoading.value = true;
      final userData = await userRepository.fetchUserDeatils();
      user(userData);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final namePart =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUserName(userCredential.user!.displayName ?? '');

        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: namePart[0],
          lastName: namePart.length > 1 ? namePart.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.warningSnackbar(
          title: "Data not saved",
          message:
              "Something went wrong while saving your profile. you can re-save your data in profile");
    }
  }
}
