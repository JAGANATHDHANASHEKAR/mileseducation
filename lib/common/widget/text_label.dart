import 'package:flutter/material.dart';
import '/common/utils/common_text_style.dart';
import '/common/themes/app_colors.dart';

class TextLabel extends StatelessWidget {
  const TextLabel({Key? key, required this.label, this.required = true})
    : super(key: key);

  final String label;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        text: label,
        style: CommonStyle.MainText14w400(),
        children: [
          if (required)
            TextSpan(
              text: "*",
              style: TextStyle(color: commonfailureMessage),
            ),
        ],
      ),
    );
  }
}
