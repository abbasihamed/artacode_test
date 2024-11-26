import 'package:artacode_test/core/app_assets/png_asset.dart';
import 'package:artacode_test/core/app_assets/svg_asset.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme().colorScheme.onPrimary,
      body: Column(
        children: [
          SvgPicture.asset(
            SvgAsset.i.logo,
            height: 109,
            width: 199,
            fit: BoxFit.fill,
          ),
          Image.asset(
            PngAsset.i.login,
          ),
          
        ],
      ),
    );
  }
}
