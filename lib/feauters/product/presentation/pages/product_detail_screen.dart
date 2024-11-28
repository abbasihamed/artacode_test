import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/extensions/size_extensions.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/auth/presentation/widgets/custom_shadow.dart';
import 'package:artacode_test/feauters/product/domain/entities/products.dart';
import 'package:artacode_test/feauters/product/presentation/controller/product_color_controller.dart';
import 'package:artacode_test/feauters/product/presentation/controller/product_image_controller.dart';
import 'package:artacode_test/feauters/product/presentation/widgets/logout_button.dart';
import 'package:artacode_test/feauters/product/presentation/widgets/product_detail_bottomsheet.dart';
import 'package:artacode_test/feauters/product/presentation/widgets/product_detail_description.dart';
import 'package:artacode_test/feauters/product/presentation/widgets/product_detail_title.dart';
import 'package:artacode_test/feauters/product/presentation/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductsEntity product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductColorController());
    Get.lazyPut(() => ProductImageController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: context.myTheme().colorScheme.onSecondary,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              CustomShadow(end: -50, shadowColor: AppColor.instance.blurColor2),
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
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductDetailTitle(product: product),
                        const ProductImageSection(),
                        const ProductDetailDescription(),
                        SizedBox(height: context.viewPadding().bottom + 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: const ProductDetailBottomSheet(),
      ),
    );
  }
}
