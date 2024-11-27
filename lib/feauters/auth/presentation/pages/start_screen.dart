import 'package:artacode_test/config/router/app_path.dart';
import 'package:artacode_test/core/app_assets/png_asset.dart';
import 'package:artacode_test/core/app_assets/svg_asset.dart';
import 'package:artacode_test/core/components/custom_button.dart';
import 'package:artacode_test/core/extensions/size_extensions.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/auth/presentation/widgets/custom_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: context.theme().colorScheme.onPrimary,
        body: Stack(
          children: [
            const CustomShadow(),
            Column(
              children: [
                SizedBox(height: context.viewPadding().top),
                Image.asset(
                  PngAsset.i.welcome,
                  width: double.infinity,
                  height: 448,
                  fit: BoxFit.fill,
                ),
                SvgPicture.asset(
                  SvgAsset.i.logo,
                  height: 109,
                  width: 199,
                  fit: BoxFit.fill,
                ),
                Text(
                  'فروشگاه گیمینو',
                  style: context.textStyle().labelLarge,
                ),
                const SizedBox(height: 17),
                Text(
                  'فروشگاه تخصصی لوازم بازی های رایانه ای و کنسول بازی',
                  style: context.textStyle().displayMedium,
                ),
              ],
            ),
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                title: 'ایجاد حساب کاربری',
                onTap: () {
                  context.goNamed(AppPathName.i.register);
                },
              ),
              TextButton(
                onPressed: () {
                  context.goNamed(AppPathName.i.login);
                },
                child: Text(
                  'قبلا ثبت نام کرده ام',
                  style: context.textStyle().labelSmall?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
              SizedBox(height: context.viewPadding().bottom),
            ],
          ),
        ),
      ),
    );
  }
}
