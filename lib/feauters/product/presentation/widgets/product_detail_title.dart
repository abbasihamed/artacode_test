import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/product/domain/entities/products.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductDetailTitle extends StatelessWidget {
  const ProductDetailTitle({super.key, required this.product});

  final ProductsEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 46),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(
              width: 95,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.instance.blue,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.instance.blue.withOpacity(.2),
                      blurRadius: 17,
                      offset: const Offset(0, 4),
                    )
                  ]),
              child: Text(
                'دسته بازی',
                style: context.textStyle().titleLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.instance.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'دسته بازی مخصوص XBOX',
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
    );
  }
}
