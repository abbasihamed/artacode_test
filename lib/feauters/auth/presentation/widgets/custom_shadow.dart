import 'package:artacode_test/config/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomShadow extends StatelessWidget {
  const CustomShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      bottom: -50,
      start: -50,
      child: Container(
        height: 253,
        width: 256,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color:AppColor.instance.blurColor ,
              blurRadius: 50,
            )
          ],
        ),
      ),
    );
  }
}
