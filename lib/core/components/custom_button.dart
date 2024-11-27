import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        width: double.infinity,
        height: 57,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.myTheme().colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          title,
          style: context.textStyle().labelMedium,
        ),
      ),
    );
  }
}
