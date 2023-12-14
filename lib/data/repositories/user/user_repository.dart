import 'package:demo_app/data/repositories/authentications/authentication_repository.dart';
import 'package:demo_app/features/authentication/models/user_model.dart';
import 'package:demo_app/utils/exception/firebase_auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:get/get.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } catch (_) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<UserModel> fetchUserDeatils() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } catch (_) {
      throw "Something went wrong. Please try again";
    }
  }
}
