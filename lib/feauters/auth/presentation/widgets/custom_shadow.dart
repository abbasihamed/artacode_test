import 'package:artacode_test/config/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomShadow extends StatelessWidget {
  final double? bottom;
  final double? top;
  final double? end;
  final double? start;
  final Color? shadowColor;
  const CustomShadow({
    super.key,
    this.bottom,
    this.top,
    this.end,
    this.start,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      bottom: bottom,
      start: start,
      top: top,
      end: end,
      child: Container(
        height: 253,
        width: 256,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: shadowColor ?? AppColor.instance.blurColor,
              blurRadius: 50,
            )
          ],
        ),
      ),
    );
  }
}
