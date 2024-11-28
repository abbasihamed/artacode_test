import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/app_assets/svg_asset.dart';
import 'package:artacode_test/feauters/product/presentation/controller/product_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 378,
      width: double.infinity,
      child: GetBuilder<ProductImageController>(
        builder: (ct) {
          return Stack(
            children: [
              PositionedDirectional(
                start: -100,
                child: Image.asset(
                  ct.currentImage,
                  height: 377,
                  width: 377,
                ),
              ),
              PositionedDirectional(
                end: 40,
                top: 0,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => ct.changeIndex('up'),
                      child: SvgPicture.asset(
                        SvgAsset.i.arrowUp,
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const SizedBox(height: 9),
                    ...List.generate(
                      ct.images.length,
                      (index) {
                        return Container(
                          height: 10,
                          width: 10,
                          margin: EdgeInsets.only(bottom: index != 2 ? 9 : 0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ct.currentIndex == index
                                  ? AppColor.instance.blue
                                  : AppColor.instance.white,
                              boxShadow: [
                                if (ct.currentIndex == index)
                                  BoxShadow(
                                    color:
                                        AppColor.instance.blue.withOpacity(.3),
                                    blurRadius: 7,
                                    offset: const Offset(0, 4),
                                  )
                              ]),
                        );
                      },
                    ),
                    const SizedBox(height: 9),
                    GestureDetector(
                      onTap: () => ct.changeIndex('down'),
                      child: SvgPicture.asset(
                        SvgAsset.i.arrowDown,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
