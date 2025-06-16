// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'app_colors.dart';

var textFieldDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  //focusColor: primaryYellow,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(width: 0.5, color: Color(0xFFB5B5B5)),
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(width: 0.5, color: Color(0xFFB5B5B5))),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(width: 0.5, color: primaryColor)),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(width: 0.5, color: errorColor),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(width: 0.5, color: errorColor),
  ),
  counterStyle: const TextStyle(fontSize: 12, height: 0.5),
  errorMaxLines: 3,
  errorStyle: TextStyle(fontSize: 11, color: errorColor),
);
