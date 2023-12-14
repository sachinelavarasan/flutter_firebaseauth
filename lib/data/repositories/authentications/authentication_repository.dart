import 'package:demo_app/features/authentication/screens/login/login.dart';
import 'package:demo_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:demo_app/features/authentication/screens/verifyemail/verify_email.dart';
import 'package:demo_app/navigation_menu.dart';
import 'package:demo_app/utils/exception/firebase_auth_exception.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirection();
  }

  screenRedirection() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(const NavigationMenu());
      } else {
        Get.offAll(VerifyEmailScreen(
          email: _auth.currentUser?.email,
        ));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  Future<UserCredential> loginWithEmailPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
    // validate all the form fields
  }

  Future<UserCredential> registerWithEmailPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
    // validate all the form fields
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
