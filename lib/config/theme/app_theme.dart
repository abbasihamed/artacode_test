import 'package:artacode_test/config/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    fontFamily: 'yekan-bakh',
    colorScheme: ColorScheme.light(
      onPrimary: AppColor.instance.purple,
      onSecondary: AppColor.instance.purple,
      onPrimaryContainer: AppColor.instance.blue,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColor.instance.white.withOpacity(.6),
      filled: true,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColor.instance.gray1,
        fontSize: 12,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide.none,
      ),
    ),
    textTheme: TextTheme(
      labelLarge: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 30,
        color: AppColor.instance.dark,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColor.instance.white,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColor.instance.gray10,
        fontSize: 14,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColor.instance.gray,
      ),
    ),
  );
}
