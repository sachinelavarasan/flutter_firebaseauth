import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_app/utils/loaders.dart';
import 'package:flutter/services.dart';
import "package:get/get.dart";

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> connectivityStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    connectivityStatus.value = result;
    if (connectivityStatus.value == ConnectivityResult.none) {
      Loaders.warningSnackbar(
          title: "No internet connection",
          message: "Check your internet connection");
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
