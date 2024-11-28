import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/components/custom_button.dart';
import 'package:artacode_test/core/extensions/size_extensions.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/product/presentation/controller/product_color_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailBottomSheet extends StatelessWidget {
  const ProductDetailBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 44,
            child: GetBuilder<ProductColorController>(
              builder: (ct) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'انتخاب رنگ',
                      style: context.textStyle().titleLarge?.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    ...List.generate(
                      ct.productColors.length,
                      (index) {
                        return GestureDetector(
                          onTap: () => ct.changeIndex(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: index == ct.currentIndex ? 44 : 30,
                            width: index == ct.currentIndex ? 44 : 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ct.productColors[index],
                              border:
                                  Border.all(color: AppColor.instance.gray2),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.only(bottom: context.viewPadding().bottom + 10),
            child: CustomButton(
              title: 'ورود',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
