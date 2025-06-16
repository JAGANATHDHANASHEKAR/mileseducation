import '../utils/constrants.dart';
import '/common/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final TextInputType? textInputType;
  final String? value;
  final Widget? suffixicon;
  final Icon? prefixicon;
  final String? hintText;
  final String? labelText;
  final bool? focus;
  final bool obscureText;
  final double? maxheight;
  final TextEditingController? controller;
  final Function()? press;
  final double? borderRadius;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final double? fontsize;
  final bool readOnly;
  final bool? enable;
  // final bool? input;
  final TextStyle? style;
  final TextAlign? align;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Color? filledColor;
  final BoxConstraints? constraints;
  final InputDecoration? decoration;
  final bool requiredfield;

  const CommonTextField({
    Key? key,
    this.value,
    this.fontsize,
    this.suffixicon,
    this.prefixicon,
    this.hintText,
    this.labelText,
    this.focus,
    this.obscureText = false,
    this.maxheight,
    this.controller,
    this.press,
    this.borderRadius,
    this.onChanged,
    this.onSubmitted,
    this.textInputType,
    this.readOnly = false,
    this.enable,
    // this.input,
    this.inputFormatters,
    this.align,
    this.maxLength,
    this.filledColor,
    this.style,
    this.constraints,
    this.decoration,
    this.requiredfield = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      maxLength: maxLength,
      readOnly: readOnly,
      keyboardType: textInputType,
      controller: controller,
      enabled: enable,
      onTap: press,
      textAlign: align ?? TextAlign.start,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      style: style ?? const TextStyle(fontSize: 14),
      autofocus: focus == null ? false : true,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        counterText: "",
        labelText: labelText,
        labelStyle: TextStyle(fontSize: fontsize ?? 14.0, color: mainColor),
        contentPadding: EdgeInsets.symmetric(
          vertical: maxheight != null ? 7 : 14.0,
          horizontal: maxheight != null ? 5 : 10.0,
        ),
        constraints: BoxConstraints(maxHeight: maxheight ?? 46),
        fillColor: filledColor ?? Colors.white,
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
          borderSide: BorderSide(width: 0.5, color: mainColor),
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: fontsize ?? 12.0),
        suffixIcon: suffixicon,
        isDense: true,
        prefixIcon: requiredfield
            ? Row(
                children: [
                  Container(
                    width: 3.5,
                    decoration: BoxDecoration(
                      color: redColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  Container(width: 0.5),
                ],
              )
            : null,
        //
        prefixIconConstraints: requiredfield
            ? const BoxConstraints.expand(width: 10.0)
            : null,
      ),
    );
  }
}
