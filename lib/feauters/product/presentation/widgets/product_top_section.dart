import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/app_assets/svg_asset.dart';
import 'package:artacode_test/core/extensions/size_extensions.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductTopSection extends StatelessWidget {
  const ProductTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: context.viewPadding().top,
      child: Container(
        color: context.myTheme().colorScheme.onSecondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: SvgPicture.asset(
                SvgAsset.i.logo,
                height: 140,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'فروشگاه',
              style: context.textStyle().labelMedium?.copyWith(
                    fontSize: 14,
                    color: AppColor.instance.dark,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
