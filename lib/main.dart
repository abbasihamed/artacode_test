import 'package:artacode_test/config/router/app_router.dart';
import 'package:artacode_test/config/theme/app_theme.dart';
import 'package:artacode_test/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'گیمینو',
      theme: AppTheme.theme,
      routerConfig: AppRouter.router,
    );
  }
}
