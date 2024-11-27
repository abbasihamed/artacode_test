import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/extensions/size_extensions.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/auth/presentation/widgets/custom_shadow.dart';
import 'package:artacode_test/feauters/product/domain/entities/products.dart';
import 'package:artacode_test/feauters/product/presentation/pages/products_screen.dart';
import 'package:artacode_test/feauters/product/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductsEntity product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: context.myTheme().colorScheme.onSecondary,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              CustomShadow(
                end: -50,
                shadowColor: AppColor.instance.blurColor2,
              ),
              CustomShadow(
                bottom: -50,
                start: -50,
                shadowColor: AppColor.instance.blurColor2,
              ),
              PositionedDirectional(
                top: context.viewPadding().top,
                end: 0,
                child: const LogoutButton(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  // color: Colors.amber,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Container(
                            width: 95,
                            height: 30,
                            decoration: BoxDecoration(
                                color: AppColor.instance.blue,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColor.instance.blue.withOpacity(.2),
                                    blurRadius: 17,
                                    offset: const Offset(0, 4),
                                  )
                                ]),
                          ),
                        ),
                        Text(
                          product.title,
                          style: context.textStyle().labelLarge,
                        ),
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: product.amount.seRagham(),
                                style: context.textStyle().labelLarge?.copyWith(
                                      color: AppColor.instance.gray3,
                                    ),
                              ),
                              TextSpan(
                                text: '  تومان',
                                style: context.textStyle().labelLarge?.copyWith(
                                      color: AppColor.instance.gray3,
                                      fontSize: 13,
                                    ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
