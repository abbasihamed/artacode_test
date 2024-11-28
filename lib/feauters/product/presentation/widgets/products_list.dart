import 'package:artacode_test/config/router/app_path.dart';
import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/extensions/size_extensions.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/product/presentation/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.viewPadding().top + 150),
      child: GetBuilder<ProductController>(
        builder: (ct) {
          return GridView.builder(
            itemCount: ct.products.length,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 45,
              crossAxisSpacing: 18,
              mainAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              final data = ct.products[index];
              return GestureDetector(
                onTap: () {
                  context.goNamed(AppPathName.i.productDetail, extra: data);
                },
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 180,
                        width: 153,
                        decoration: BoxDecoration(
                          color: AppColor.instance.white.withOpacity(.5),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.instance.dark.withOpacity(0.1),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 80),
                            Text(
                              data.title,
                              style: context.textStyle().titleMedium,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              data.amount.seRagham(),
                              style: context.textStyle().labelLarge?.copyWith(
                                    color: AppColor.instance.gray3,
                                    fontSize: 30,
                                  ),
                            ),
                            Text(
                              'تومان',
                              style: context.textStyle().labelLarge?.copyWith(
                                    color: AppColor.instance.gray3,
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        data.img,
                        width: 105,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
