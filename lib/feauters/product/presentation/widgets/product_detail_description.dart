import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/product/presentation/controller/show_more_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailDescription extends StatelessWidget {
  const ProductDetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final ct = Get.put(ShowMoreController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 46),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'توضیحات',
              style: context.textStyle().titleLarge,
            ),
          ),
          Obx(
            () {
              return IntrinsicHeight(
                child: Stack(
                  children: [
                    Text(
                      'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون',
                      style: context.textStyle().titleSmall,
                      maxLines: ct.isShow.value ? null : 3,
                      overflow: ct.isShow.value ? null : TextOverflow.ellipsis,
                    ),
                    if (!ct.isShow.value)
                      Container(
                        height: 85,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              context
                                  .myTheme()
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.1),
                              context.myTheme().colorScheme.onSecondary,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          ct.isShow.value ? 'کمتر -' : 'بیشتر +',
                          style: context.textStyle().titleLarge?.copyWith(
                                color: AppColor.instance.blue,
                                fontSize: 12,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
