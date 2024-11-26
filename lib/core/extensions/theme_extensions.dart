import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  ThemeData theme() => Theme.of(this);
  TextTheme textStyle() => Theme.of(this).textTheme;
}
