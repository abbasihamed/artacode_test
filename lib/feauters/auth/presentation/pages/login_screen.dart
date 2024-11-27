import 'package:artacode_test/config/router/app_path.dart';
import 'package:artacode_test/core/app_assets/png_asset.dart';
import 'package:artacode_test/core/app_assets/svg_asset.dart';
import 'package:artacode_test/core/components/custom_button.dart';
import 'package:artacode_test/core/components/input_field.dart';
import 'package:artacode_test/core/extensions/size_extensions.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/auth/presentation/widgets/custom_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFe0e6ff),
        body: Stack(
          children: [
            const CustomShadow(
              bottom: -50,
              start: -50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 41),
              child: Column(
                children: [
                  SizedBox(height: context.viewPadding().top),
                  SvgPicture.asset(
                    SvgAsset.i.logo,
                    height: 109,
                    width: 199,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    PngAsset.i.login,
                    width: double.infinity,
                    height: 227,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 24),
                  const InputField(
                    title: 'ایمیل',
                    hint: 'Info@example.com',
                  ),
                  const SizedBox(height: 14),
                  const InputField(
                    title: 'رمز عبور',
                    hint: 'رمز عبور دلخواه حداقل 5 کاراکتر',
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                title: 'ورود',
                onTap: () {},
              ),
              TextButton(
                onPressed: () {
                  context.goNamed(AppPathName.i.register);
                },
                child: Text(
                  'ایجاد حساب کاربری',
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
