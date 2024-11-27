import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/app_assets/svg_asset.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        height: 37,
        width: 79,
        decoration: BoxDecoration(
          color: AppColor.instance.green4,
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(8),
            bottomStart: Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'خروج',
              style: context.textStyle().labelSmall?.copyWith(
                    fontSize: 15,
                    color: AppColor.instance.gray4.withOpacity(.6),
                  ),
            ),
            SvgPicture.asset(
              SvgAsset.i.loguot,
              height: 15,
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
