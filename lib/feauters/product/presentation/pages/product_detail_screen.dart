import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/app_assets/png_asset.dart';
import 'package:artacode_test/core/app_assets/svg_asset.dart';
import 'package:artacode_test/core/components/custom_button.dart';
import 'package:artacode_test/core/extensions/size_extensions.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/auth/presentation/widgets/custom_shadow.dart';
import 'package:artacode_test/feauters/product/domain/entities/products.dart';
import 'package:artacode_test/feauters/product/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                        Container(
                          color: Colors.amber,
                          height: 378,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              PositionedDirectional(
                                start: -100,
                                child: Image.asset(
                                  PngAsset.i.phones,
                                  height: 377,
                                  width: 377,
                                ),
                              ),
                              PositionedDirectional(
                                end: 0,
                                top: 0,
                                bottom: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      SvgAsset.i.arrowUp,
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(height: 9),
                                    ...List.generate(
                                      3,
                                      (index) {
                                        return Container(
                                          height: 10,
                                          width: 10,
                                          margin: EdgeInsets.only(
                                              bottom: index != 2 ? 9 : 0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.instance.blue,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColor.instance.blue
                                                      .withOpacity(.3),
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 4),
                                                )
                                              ]),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 9),
                                    SvgPicture.asset(
                                      SvgAsset.i.arrowDown,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'توضیحات',
                            style: context.textStyle().titleLarge,
                          ),
                        ),
                        Container(
                          // color: Colors.amber,
                          height: 100,
                          child: Stack(
                            children: [
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) =>
                                    LinearGradient(colors: [
                                  AppColor.instance.gray.withOpacity(.1),
                                  AppColor.instance.gray,
                                ]).createShader(
                                  Rect.fromLTWH(
                                    .1,
                                    bounds.bottom,
                                    bounds.bottom,
                                    0,
                                  ),
                                ),
                                child: Text(
                                  'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون',
                                  style: context.textStyle().titleSmall,
                                  // maxLines: 2,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // Container(
                              //   height: double.infinity,
                              //   width: double.infinity,
                              //   decoration: BoxDecoration(
                              //       gradient: LinearGradient(colors: [
                              //     AppColor.instance.gray,
                              //     AppColor.instance.gray.withOpacity(.1),
                              //   ])),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: context.viewPadding().bottom + 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'انتخاب رنگ',
                  ),
                  ...List.generate(
                    4,
                    (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: index == 2 ? 44 : 30,
                        width: index == 2 ? 44 : 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.instance.blue,
                          border: Border.all(color: AppColor.instance.gray2),
                        ),
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 12),
              Padding(
                padding:
                    EdgeInsets.only(bottom: context.viewPadding().bottom + 10),
                child: CustomButton(
                  title: 'ورود',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
