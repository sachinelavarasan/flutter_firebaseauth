import 'package:demo_app/data/repositories/authentications/authentication_repository.dart';
import 'package:demo_app/features/personalisation/controllers/user_controller.dart';
import 'package:demo_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.put(UserController());
    final authRepo = Get.put(AuthenticationRepository());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 56, bottom: 20, left: 20, right: 20),
          child: Card(
            elevation: 1.0,
            color: Colors.white60,
            child: SizedBox(
              width: HelperFunctions.screenWidth(),
              height: HelperFunctions.screenHeight() * 0.7,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Card(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      elevation: 6,
                      child: Image.network(
                        usercontroller.user.value.profilePicture,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.black45,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          Text(
                            usercontroller.user.value.fullName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black26,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          Text(
                            usercontroller.user.value.email,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black26,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Username",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          Text(
                            usercontroller.user.value.username,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black26,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red[600]),
                      ),
                      onPressed: () => authRepo.logOut(),
                      child: const Text(
                        "Log out",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
