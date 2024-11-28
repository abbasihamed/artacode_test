// ignore_for_file: use_build_context_synchronously

import 'package:artacode_test/config/router/app_path.dart';
import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/app_assets/png_asset.dart';
import 'package:artacode_test/core/app_assets/svg_asset.dart';
import 'package:artacode_test/core/components/custom_button.dart';
import 'package:artacode_test/core/components/input_field.dart';
import 'package:artacode_test/core/extensions/size_extensions.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/di.dart';
import 'package:artacode_test/feauters/auth/domain/repositories/auth_repository.dart';
import 'package:artacode_test/feauters/auth/presentation/controller/register_controller.dart';
import 'package:artacode_test/feauters/auth/presentation/widgets/custom_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RegisterController(locator<AuthRepository>()));
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFFe0e6ff),
        body: Stack(
          children: [
            GetBuilder<RegisterController>(
              id: 'loading',
              builder: (controller) {
                if (controller.isLoading) {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return Align(
                          child: CircularProgressIndicator(
                            color: AppColor.instance.blue,
                          ),
                        );
                      },
                    );
                  });
                }
                return const SizedBox();
              },
            ),
            const CustomShadow(
              bottom: -50,
              start: -50,
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 41),
              child: SizedBox(
                height: MediaQuery.maybeOf(context)?.size.height,
                width: double.infinity,
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
                    GetBuilder<RegisterController>(
                      id: 'email',
                      builder: (controller) {
                        return InputField(
                          title: 'ایمیل',
                          hint: 'Info@example.com',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.go,
                          onChanged: (value) {
                            controller.changeEmail(value);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    GetBuilder<RegisterController>(
                      id: 'pass',
                      builder: (controller) {
                        return InputField(
                          title: 'رمز عبور',
                          hint: 'رمز عبور دلخواه حداقل 5 کاراکتر',
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {
                            controller.changePassword(value);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    GetBuilder<RegisterController>(
                      id: 'error',
                      builder: (ct) {
                        if (ct.hasError) {
                          return Align(
                            alignment: const AlignmentDirectional(-.9, 0),
                            child: Text(
                              ct.erroMsg,
                              style: context
                                  .textStyle()
                                  .labelSmall
                                  ?.copyWith(color: Colors.red),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomButton(
                            title: 'ثبت نام',
                            onTap: () {
                              Get.find<RegisterController>().registerUser();
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
