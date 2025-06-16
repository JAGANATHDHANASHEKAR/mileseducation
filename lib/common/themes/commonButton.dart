// ignore_for_file: prefer_const_constructors_in_immutables, file_names, unnecessary_null_comparison

import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Function() onPressed;
  final String textarea;
  final Color color;
  final Color fontColor;
  final Icon? icon;
  final double? fontsize;
  final FontWeight? fontWeight;

  CommonButton({
    Key? key,
    required this.onPressed,
    required this.textarea,
    required this.color,
    required this.fontColor,
    this.icon,
    this.fontsize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      color: color,
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 38,
          child: Center(
            child: icon == null
                ? Text(
                    textarea,
                    style: TextStyle(
                      fontSize: fontsize ?? 14.0,
                      color: fontColor,
                      fontWeight: fontWeight ?? FontWeight.w400,
                    ),
                  )
                : Row(
                    children: [
                      icon ?? Container(),
                      const SizedBox(width: 5),
                      Text(
                        textarea,
                        style: TextStyle(
                          fontSize: fontsize ?? 14,
                          color: fontColor,
                          fontWeight: fontWeight ?? FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
