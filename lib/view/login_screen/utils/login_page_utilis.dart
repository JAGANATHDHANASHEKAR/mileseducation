// ignore_for_file: avoid_print
import 'package:mileseducation/view/splash_screen/splash_screen.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/utils/shared_prefs.dart';
import 'package:local_auth/local_auth.dart';

Future<void> requestBiometricAuthentication() async {
  final localAuth = LocalAuthentication();
  try {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    bool canAuthenticateWithBiometrics = await localAuth.isDeviceSupported();

    if (canCheckBiometrics && canAuthenticateWithBiometrics) {
      bool didAuthenticate = await localAuth.authenticate(
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          sensitiveTransaction: false,
          stickyAuth: true,
        ),
        localizedReason: 'Authenticate to access secure features',
      );

      if (didAuthenticate) {
        print('User authenticated successfully');
        SharedPrefs.setFingerPrint(true);
        biometricfingerprint = true;
      } else {
        print('Authentication failed');
        biometricfingerprint = false;
        SharedPrefs.setFingerPrint(false);
      }
    } else {
      print('Biometrics not available on this device');
      biometricfingerprint = false;
      SharedPrefs.setFingerPrint(false);
    }
  } catch (e) {
    print('Error: $e');
    biometricfingerprint = false;
    SharedPrefs.setFingerPrint(false);
  }
}

Future<bool> requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    return true;
  } else {
    var result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    }
  }
  return false;
}

bool isValidEmail(String email) {
  final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailRegExp.hasMatch(email);
}
