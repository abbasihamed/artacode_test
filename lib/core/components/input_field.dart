import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  const InputField({super.key, required this.title, required this.hint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 84,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 12),
            child: Text(
              title,
              style: context
                  .textStyle()
                  .labelSmall
                  ?.copyWith(color: AppColor.instance.dark),
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ],
      ),
    );
  }
}
