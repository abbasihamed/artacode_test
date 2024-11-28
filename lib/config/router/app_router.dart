import 'package:artacode_test/config/pref/app_pref.dart';
import 'package:artacode_test/config/router/app_path.dart';
import 'package:artacode_test/di.dart';
import 'package:artacode_test/feauters/auth/presentation/pages/login_screen.dart';
import 'package:artacode_test/feauters/auth/presentation/pages/register_screen.dart';
import 'package:artacode_test/feauters/auth/presentation/pages/start_screen.dart';
import 'package:artacode_test/feauters/product/domain/entities/products.dart';
import 'package:artacode_test/feauters/product/presentation/pages/product_detail_screen.dart';
import 'package:artacode_test/feauters/product/presentation/pages/products_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/wellcome',
    routes: [
      GoRoute(
        path: '/wellcome',
        name: AppPathName.i.wellcome,
        builder: (context, state) {
          return const StartScreen();
        },
        redirect: (context, state) {
          if (locator<AppPref>().getToken().isNotEmpty) {
            return '/products';
          }
          return null;
        },
        routes: [
          GoRoute(
            path: '/register',
            name: AppPathName.i.register,
            builder: (context, state) {
              return const RegisterScreen();
            },
          ),
          GoRoute(
            path: '/login',
            name: AppPathName.i.login,
            builder: (context, state) {
              return const LoginScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/products',
        name: AppPathName.i.products,
        builder: (context, state) {
          return const ProductsScreen();
        },
        routes: [
          GoRoute(
            path: '/products-detail',
            name: AppPathName.i.productDetail,
            builder: (context, state) {
              return ProductDetailScreen(
                  product: state.extra as ProductsEntity);
            },
          ),
        ],
      ),
    ],
  );
}
