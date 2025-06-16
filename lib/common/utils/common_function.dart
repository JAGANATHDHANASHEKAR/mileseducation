// ignore_for_file: deprecated_member_use
// // // Comment if u run for Mobile
// import 'dart:io';
// import "dart:html" as html;
import 'package:intl/intl.dart';
import 'package:mileseducation/common/themes/commonButton.dart';
import '../constants/commonstring.dart';
import '../utils/constrants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../utils/common_text_style.dart';
import 'package:lottie/lottie.dart';
import '../themes/app_colors.dart';

String getCurrentDate(DateTime dateTime) {
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

PopupProps<String> getPopupProps() {
  return PopupProps.menu(
    searchFieldProps: TextFieldProps(
      autofocus: true,
      padding: const EdgeInsets.all(5),
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          gapPadding: 2,
          borderSide: BorderSide(color: commonBorder, width: 0.5),
        ),
      ),
    ),
    showSearchBox: true,
    fit: FlexFit.loose,
  );
}

Widget getDropDownBuilder(context, selectedItem) {
  return Text(
    selectedItem ?? CommonString.select,
    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
    overflow: TextOverflow.ellipsis,
  );
}

DropDownDecoratorProps getDropDownDecoratorProps({
  EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
    vertical: 14.0,
    horizontal: 10,
  ),
  bool alignLabelWithHint = false,
}) {
  return DropDownDecoratorProps(
    dropdownSearchDecoration: InputDecoration(
      hintText: CommonString.select,
      isDense: true,
      filled: false,
      labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      contentPadding: padding,
      border: InputBorder.none,
      alignLabelWithHint: alignLabelWithHint,
      suffixIcon: const Icon(Icons.arrow_downward, size: 7),
    ),
  );
}

Text getText(
  String text, [
  TextStyle? style,
  TextAlign textAlign = TextAlign.center,
]) {
  return Text(text, textAlign: textAlign, style: style);
}

Widget nodataFounddata() {
  return Center(
    child: Text("No Data Found!", style: CommonStyle.greyText16w500()),
  );
}

Widget noInternet(onPress) {
  return Column(
    children: [
      Lottie.asset(
        "assets/images/noInternet.json",
        fit: BoxFit.cover,
        height: 180,
      ),
      const SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonButton(
            onPressed: onPress,
            textarea: "Retry",
            color: mainColor,
            fontColor: whiteColor,
          ),
        ],
      ),
    ],
  );
}

Widget mapsnoInternet(onPress) {
  return Column(
    children: [
      Lottie.asset(
        "assets/images/mapnoInternet.json",
        fit: BoxFit.cover,
        height: 180,
      ),
      const SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonButton(
            onPressed: onPress,
            textarea: "Retry",
            color: mainColor,
            fontColor: whiteColor,
          ),
        ],
      ),
    ],
  );
}

Widget errorOccurred() {
  return Center(child: Lottie.asset("assets/images/errorOccurred.json"));
}

void showProgress(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    useSafeArea: true,
    builder: (context) => WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          color: Colors.transparent,
          width: 70,
          height: 70,
          child: Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(color: mainColor),
            ),
          ),
        ),
      ),
    ),
  );
}

void closeProgress(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}

TextStyle headerTextSyle() {
  return const TextStyle(fontSize: 13, fontWeight: FontWeight.w700);
  // TextStyle(
  //     fontSize: 13.0, color: CommonDefaultFont, fontWeight: FontWeight.w700);
}

TextStyle headstyleMobile() {
  return const TextStyle(fontSize: 10, fontWeight: FontWeight.w800);
  // TextStyle(
  //     fontSize: 13.0, color: CommonDefaultFont, fontWeight: FontWeight.w700);
}
