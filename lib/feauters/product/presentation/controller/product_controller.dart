import 'package:artacode_test/feauters/product/domain/entities/products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final List<ProductsEntity> _products = const [
    ProductsEntity(
      title: 'دسته بازی  XBOX',
      desc:
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون',
      img: 'assets/images/joy_stick.png',
      amount: '500000',
    ),
    ProductsEntity(
      title: 'دسته بازی  XBOX',
      desc:
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون',
      img: 'assets/images/phones.png',
      amount: '500000',
    ),
    ProductsEntity(
      title: 'دسته بازی  XBOX',
      desc:
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون',
      img: 'assets/images/tv.png',
      amount: '500000',
    ),
    ProductsEntity(
      title: 'دسته بازی  XBOX',
      desc:
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون',
      img: 'assets/images/watch.png',
      amount: '500000',
    ),
    ProductsEntity(
      title: 'دسته بازی  XBOX',
      desc:
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون',
      img: 'assets/images/joy_stick.png',
      amount: '500000',
    ),
    ProductsEntity(
      title: 'دسته بازی  XBOX',
      desc:
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون',
      img: 'assets/images/joy_stick.png',
      amount: '500000',
    ),
  ];

  List<ProductsEntity> get products => _products;
}
