import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductColorController extends GetxController {
  final List<Color> _productColor = const [
    Color(0xFFFFFFFF),
    Color(0xFF0183FF),
    Color(0xFFFFD707),
    Color(0xFF000000),
  ];

  int currentIndex = 0;

  List<Color> get productColors => _productColor;

  changeIndex(int index) {
    currentIndex = index;
    update();
  }
}
