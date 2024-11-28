import 'package:flutter/material.dart';

import 'package:artacode_test/config/theme/app_color.dart';
import 'package:artacode_test/core/extensions/theme_extensions.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String value)? onChanged;
  const InputField({
    super.key,
    required this.title,
    required this.hint,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
  });

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
            onChanged: (value) {
              onChanged?.call(value);
            },
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ],
      ),
    );
  }
}
