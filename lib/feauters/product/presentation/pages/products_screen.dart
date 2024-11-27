import 'package:artacode_test/config/router/app_path.dart';
import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/app_assets/svg_asset.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/product/presentation/controller/product_controller.dart';
import 'package:artacode_test/feauters/product/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: context.myTheme().colorScheme.onSecondary,
        appBar: AppBar(
          backgroundColor: context.myTheme().colorScheme.onSecondary,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: 160,
          title: Column(
            children: [
              SvgPicture.asset(
                SvgAsset.i.logo,
                height: 140,
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
          actions: const [LogoutButton()],
        ),
        body: GetBuilder<ProductController>(
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
      ),
    );
  }
}
