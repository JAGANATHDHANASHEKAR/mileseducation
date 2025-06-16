// ignore_for_file: file_names

import 'package:mileseducation/common/themes/common_dialog_box.dart';

import '../../../common/constants/commonstring.dart';
import '../../../common/utils/page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../common/utils/toast_message.dart';
import 'package:geolocator/geolocator.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

//Request for Media Permission to Access the Application
Future<void> requestMediaPermissions() async {
  // Requesting location permission for 'Allow All the Time'
  Map<Permission, PermissionStatus> statuses = await [
    Permission.location, // Location permission with 'Allow All the Time' option
    Permission.camera,
    Permission.microphone,
    Permission.photos,
    Permission.manageExternalStorage,
  ].request();
  // Check if all required permissions are granted
  if (statuses[Permission.camera]?.isGranted == true &&
      statuses[Permission.microphone]?.isGranted == true &&
      statuses[Permission.photos]?.isGranted == true &&
      statuses[Permission.manageExternalStorage]?.isGranted == true &&
      statuses[Permission.location]?.isGranted == true) {
    // All permissions granted, proceed further
  } else {
    // Handle denied permissions
    return;
  }
}

Future<LatLng?> getCurrentLocation(context) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    showToast(context, "Location services are disabled.");
    return null;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      showToast(context, "Location permissions are denied.");
      return null;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    showToast(context, "Location permissions are permanently denied.");
    return null;
  }

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  return LatLng(position.latitude, position.longitude);
}

// Dialog Box to Exit the Application
Future<bool> showExitDialog(context) async {
  return (await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => CommonDialogBox(
          title: CommonString.exitApp,
          description: CommonString.exitAppPermission,
          onPress: () {
            navigatePop(context);
            SystemNavigator.pop();
          },
          onCancel: () {
            navigatePop(context);
          },
        ),
      )) ??
      false;
}
