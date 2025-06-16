// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mileseducation/common/utils/constrants.dart';
import '/common/themes/app_colors.dart';

class CommonTextArea extends StatelessWidget {
  final Icon? suffixicon;
  final Icon? prefixicon;
  final String? hintText;
  final String? labelText;
  final bool? focus;
  final bool? enabled;
  final bool readonly;
  final TextEditingController? controller;
  final Function()? press;
  final double? borderRadius;
  final Function(String)? onChanged;

  const CommonTextArea({
    Key? key,
    this.suffixicon,
    this.prefixicon,
    this.hintText,
    this.labelText,
    this.controller,
    this.press,
    this.onChanged,
    this.borderRadius,
    this.enabled,
    this.readonly = false,
    this.focus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 14.0, color: mainColor),
      controller: controller,
      maxLines: 3,
      onTap: press,
      onChanged: onChanged,
      autofocus: focus == null ? false : true,
      enabled: enabled == null ? true : false,
      readOnly: readonly,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 15,
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          borderSide: BorderSide(width: 0.5, color: commonBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(width: 0.5, color: commonBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(width: 0.5, color: commonBorder),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
        suffixIcon: suffixicon,
        suffixStyle: const TextStyle(color: Colors.black),
        isDense: true,
      ),
    );
  }
}
