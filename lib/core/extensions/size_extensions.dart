import 'package:flutter/material.dart';

extension AppMediaQuery on BuildContext {
  EdgeInsets viewPadding() => MediaQuery.maybeOf(this)!.viewPadding;
}
