import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

navigatePush(context, page) {
  FocusManager.instance.primaryFocus?.unfocus();
  return Navigator.push(context, CupertinoPageRoute(builder: (_) => page));
}

navigateRemoveAll(context, page) {
  FocusManager.instance.primaryFocus?.unfocus();
  return Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (_) => page),
      (Route<dynamic> route) => false);
}

navigateReplace(context, page) {
  FocusManager.instance.primaryFocus?.unfocus();
  return Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (_) => page));
}

navigatePop(context) {
  FocusManager.instance.primaryFocus?.unfocus();
  return Navigator.pop(context);
}

navigatePopUntil(context) {
  FocusManager.instance.primaryFocus?.unfocus();
  int count = 0;
  return Navigator.of(context).popUntil((route) => count++ >= 2);
}

navigatePopUntil3(context) {
  FocusManager.instance.primaryFocus?.unfocus();
  int count = 0;
  return Navigator.of(context).popUntil((route) => count++ >= 3);
}

navigate(context, page) {
  FocusManager.instance.primaryFocus?.unfocus();
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

navigateCupertino(context, page) {
  FocusManager.instance.primaryFocus?.unfocus();
  return Navigator.push(
      context, CupertinoPageRoute(builder: (context) => page));
}

navigateReplaceCupertino(context, page) {
  FocusManager.instance.primaryFocus?.unfocus();
  return Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => page));
}

navigatepopCupertino(context, page) {
  FocusManager.instance.primaryFocus?.unfocus();
  return Navigator.pop(context, CupertinoPageRoute(builder: (context) => page));
}

navigateRemoveAllCupertino(context, page) {
  FocusManager.instance.primaryFocus?.unfocus();
  return Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false);
}
