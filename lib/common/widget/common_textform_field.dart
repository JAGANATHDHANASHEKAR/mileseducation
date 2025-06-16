// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/common/themes/app_colors.dart';
import '/common/themes/textstyles.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    super.key,
    this.controller,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.digitsOnly = false,
    this.isNeumric = false,
    this.suffixIcon,
    this.validator,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.maxChars,
    this.width,
    this.icon,
    this.inputFormatters,
    this.keyboardType,
    this.onfiledsubmit,
    this.onsaved,
  });

  final TextEditingController? controller;
  final VoidCallback? onTap;
  final Icons? icon;
  final Function(String?)? onChanged;
  final bool digitsOnly;
  final bool isNeumric;
  final bool readOnly;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  final bool enabled;
  final TextAlign textAlign;
  final int? maxChars;
  final double? width;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function(String?)? onfiledsubmit;
  final Function(String?)? onsaved;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  var border = OutlineInputBorder(
    borderSide: BorderSide(width: 0.5, color: commonBorder),
  );

  var errorBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 0.5, color: commonfailureMessage),
  );

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.readOnly,
      child: SizedBox(
        width: widget.width,
        child: TextFormField(
          onSaved: widget.onsaved,
          onFieldSubmitted: widget.onfiledsubmit,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          enabled: widget.enabled,
          style: regular.copyWith(fontSize: 12),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            constraints: const BoxConstraints(maxHeight: 38),
            enabledBorder: border,
            border: border,
            errorBorder: errorBorder,
            focusedBorder: border,
            disabledBorder: border,
            focusedErrorBorder: errorBorder,
            fillColor: widget.readOnly ? Colors.grey.shade100 : null,
            filled: widget.readOnly,
            suffixIcon: widget.suffixIcon != null ? widget.suffixIcon : null,
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 40,
              minWidth: 30,
            ),
          ),
          inputFormatters: [
            if (widget.digitsOnly) FilteringTextInputFormatter.digitsOnly,
            if (widget.isNeumric)
              FilteringTextInputFormatter.allow(RegExp(r"^[0-9]+.?[0-9]*")),
            if (widget.maxChars != null)
              LengthLimitingTextInputFormatter(widget.maxChars),
            if (widget.inputFormatters != null) ...widget.inputFormatters!,
          ],
          validator: widget.validator,
          readOnly: widget.readOnly,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          textAlign: widget.textAlign,
        ),
      ),
    );
  }
}
