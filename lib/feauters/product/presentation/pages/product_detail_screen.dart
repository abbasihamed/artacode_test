import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:artacode_test/feauters/product/domain/entities/products.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductsEntity product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: context.myTheme().colorScheme.onSecondary,
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
