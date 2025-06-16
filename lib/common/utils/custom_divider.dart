// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../utils/constrants.dart';

class CustomDivider {
  static ThinDivider() {
    return const Divider(
      thickness: 1,
      color: thinDividerColor,
    );
  }

  static fliterthin() {
    return const Divider(
      thickness: 0.5,
      color: thinDividerColor,
    );
  }

  static blackthin() {
    return const Divider(
      thickness: 0.3,
      color: blackColor,
    );
  }

  static mediumThinDivider() {
    return const Divider(
      thickness: 0.5,
      color: mediumGreyColor,
    );
  }

  static MediumDivider() {
    return const Divider(
      thickness: 5,
      color: thinDividerColor,
    );
  }

  static blackDivider() {
    return const Divider(
      thickness: 5,
      color: blackColor,
    );
  }

  static ThickDivider() {
    return const Divider(
      thickness: 20,
      color: categoryBgColor,
    );
  }

  static ThickDividerWithText(Size size, title, style) {
    return Container(
      height: 30,
      alignment: Alignment.centerLeft,
      width: size.width,
      color: categoryBgColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}
