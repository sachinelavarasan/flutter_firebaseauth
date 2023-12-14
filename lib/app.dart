import 'package:demo_app/binding/general_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      themeMode: ThemeMode.light,
      initialBinding: GeneralBinding(),
      home: const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
