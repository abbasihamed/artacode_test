import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  ThemeData myTheme() => Theme.of(this);
  TextTheme textStyle() => Theme.of(this).textTheme;
}
