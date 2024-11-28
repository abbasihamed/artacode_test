import 'package:artacode_test/core/app_assets/png_asset.dart';
import 'package:get/get.dart';

class ProductImageController extends GetxController {
  final List<String> _images = [
    PngAsset.i.phones,
    PngAsset.i.tv,
    PngAsset.i.watch,
  ];

  int currentIndex = 0;
  String currentImage = PngAsset.i.phones;

  List<String> get images => _images;
  changeIndex(String arrow) {
    if (currentIndex > 0 && arrow == 'up') {
      currentIndex--;
    }
    if (currentIndex < _images.length - 1 && arrow == 'down') {
      currentIndex++;
    }
    currentImage = _images[currentIndex];
    update();
  }
}
