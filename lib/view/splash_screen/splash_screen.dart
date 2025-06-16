// ignore_for_file: avoid_print, empty_catches, use_build_context_synchronously

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mileseducation/view/login_screen/screens/signIn.dart';
import '../../common/utils/constrants.dart';
import '../dashBoard_screen/screens/dashBoard_page.dart';

String? jwToken;
bool biometricfingerprint = false;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Widget _targetPage = const SignInPageScreen();
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Center(child: Image.asset("assets/images/logo.png", width: 200)),
      backgroundColor: appBackGroundColor,
      splashIconSize: 250,
      duration: 600,
      splashTransition: SplashTransition.scaleTransition,
      animationDuration: const Duration(seconds: 1),
      screenFunction: () async {
        if (jwToken != null) {
          if (biometricfingerprint) {
            await _handleBiometricAuth();
          } else {
            _targetPage = DashBoardPage(selectedIndex: 0);
          }
        } else {
          _targetPage = const SignInPageScreen();
        }
        return _targetPage;
      },
    );
  }

  Future<void> _handleBiometricAuth() async {
    final localAuth = LocalAuthentication();
    try {
      bool canCheck = await localAuth.canCheckBiometrics;
      if (canCheck) {
        bool didAuthenticate = await localAuth.authenticate(
          localizedReason: 'Authenticate to access application',
          options: const AuthenticationOptions(
            biometricOnly: false,
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
        if (didAuthenticate) {
          _targetPage = DashBoardPage(selectedIndex: 0);
        } else {
          _targetPage = const SignInPageScreen();
        }
      } else {
        _targetPage = const SignInPageScreen();
      }
    } catch (e) {
      _targetPage = const SignInPageScreen();
    }
  }
}
