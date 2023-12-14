import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.blue,
      selectionHandleColor: Colors.lightBlue,
    ),
    textTheme: TextTheme(
        headlineLarge: const TextStyle().copyWith(
            fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
        headlineMedium: const TextStyle().copyWith(
            fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
        headlineSmall: const TextStyle().copyWith(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          side: const BorderSide(color: Colors.blue),
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          textStyle: const TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.grey[100],
          backgroundColor: Colors.grey[100],
          disabledForegroundColor: Colors.grey[200],
          disabledBackgroundColor: Colors.grey[200],
          side: const BorderSide(color: Colors.grey),
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          textStyle: const TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
      hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
      errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
      floatingLabelStyle:
          const TextStyle().copyWith(fontSize: 14, color: Colors.black),
      border: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.grey)),
      enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.grey)),
      focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.black12)),
      errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.red)),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.orange)),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
    )),
  );
}
