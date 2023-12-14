import 'package:demo_app/data/repositories/authentications/authentication_repository.dart';
import 'package:demo_app/features/personalisation/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
    final usercontroller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Obx(
          () => Text(usercontroller.user.value.fullName),
        ),
        actions: [
          IconButton(
              onPressed: () => controller.logOut(),
              icon: const Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Obx(
            () => Text('Welcome ${usercontroller.user.value.fullName}'),
          ),
        ),
      ),
    );
  }
}
