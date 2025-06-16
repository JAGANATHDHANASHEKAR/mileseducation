import 'package:flutter/material.dart';
import '/common/widget/text_label.dart';

class FormItem extends StatelessWidget {
  const FormItem({
    Key? key,
    required this.label,
    this.isRequired = true,
    required this.child,
    this.isDense = false,
  }) : super(key: key);

  final String label;
  final bool isRequired;
  final Widget child;
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: isDense ? null : 100,
          child: TextLabel(label: label, required: isRequired),
        ),
        const SizedBox(width: 8),
        child,
      ],
    );
  }
}
