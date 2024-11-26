import 'package:artacode_test/config/router/app_path.dart';
import 'package:artacode_test/feauters/auth/presentation/pages/register_screen.dart';
import 'package:artacode_test/feauters/auth/presentation/pages/start_screen.dart';
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
        routes: [
          GoRoute(
            path: '/register',
            name: AppPathName.i.register,
            builder: (context, state) {
              return const RegisterScreen();
            },
          ),
        ],
      ),
    ],
  );
}
