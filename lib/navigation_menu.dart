import 'package:demo_app/features/authentication/screens/home/home.dart';
import 'package:demo_app/features/personalisation/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          indicatorColor: Colors.grey[300],
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
          height: 70,
          elevation: 0.3,
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Durations.medium2,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationMenuController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  final screen = [
    const HomeScreen(),
    Scaffold(
      backgroundColor: Colors.grey[100],
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(child: Text("Welcome to the Cart")),
      ),
    ),
    const ProfileScreen(),
  ];
}
