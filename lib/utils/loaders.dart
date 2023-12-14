import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loaders extends GetxController {
  static Loaders get instance => Get.find();

  static successSnackbar({required title, message = "", duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.blue,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(15),
      icon: const Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }

  static warningSnackbar({required title, message = "", duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(15),
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
    );
  }

  static errorSnackbar({required title, message = "", duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(15),
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
    );
  }
}
