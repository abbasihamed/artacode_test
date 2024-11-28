import 'package:artacode_test/core/extensions/size_extensions.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/product/presentation/controller/product_controller.dart';
import 'package:artacode_test/feauters/product/presentation/widgets/logout_button.dart';
import 'package:artacode_test/feauters/product/presentation/widgets/product_top_section.dart';
import 'package:artacode_test/feauters/product/presentation/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: context.myTheme().colorScheme.onSecondary,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              const ProductsList(),
              const ProductTopSection(),
              PositionedDirectional(
                top: context.viewPadding().top + 10,
                end: 0,
                child: const LogoutButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
