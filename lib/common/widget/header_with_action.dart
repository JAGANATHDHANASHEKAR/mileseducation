// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mileseducation/common/themes/commonButton.dart';
import '../utils/common_text_style.dart';

class HeaderWithActions extends StatefulWidget {
  final IconData? icon;
  final String? description;
  final Color? primaryButtonColor;
  final Color? primaryButtonTextColor;
  final String primaryButtonText;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;
  final String? secondaryButtonText;
  final Color? secondaryButtonColor;
  final Color? secondaryButtonTextColor;

  const HeaderWithActions({
    Key? key,
    this.icon,
    this.description,
    this.primaryButtonColor,
    this.primaryButtonTextColor,
    required this.primaryButtonText,
    required this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.secondaryButtonText,
    this.secondaryButtonColor,
    this.secondaryButtonTextColor,
  }) : super(key: key);

  @override
  _HeaderWithActionsState createState() => _HeaderWithActionsState();
}

class _HeaderWithActionsState extends State<HeaderWithActions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(widget.icon, size: 22, color: Colors.grey),
            const SizedBox(width: 10.0),
            Text(
              widget.description ?? "",
              style: CommonStyle.BlackText16w600(),
            ),
          ],
        ),
        Row(
          children: [
            // Optional Secondary Button
            if (widget.onSecondaryButtonPressed != null &&
                widget.secondaryButtonText != null) ...[
              const SizedBox(width: 12.0),
              CommonButton(
                onPressed: widget.onSecondaryButtonPressed!,
                textarea: widget.secondaryButtonText!,
                color: widget.secondaryButtonColor ?? Colors.white,
                fontColor: widget.secondaryButtonTextColor ?? Colors.black,
              ),
              const SizedBox(width: 10),
              // Primary Button
              CommonButton(
                onPressed: widget.onPrimaryButtonPressed,
                textarea: widget.primaryButtonText,
                color: widget.primaryButtonColor ?? Colors.white,
                fontColor: widget.primaryButtonTextColor ?? Colors.black,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
