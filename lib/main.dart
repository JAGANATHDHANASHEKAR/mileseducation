// ignore_for_file: avoid_print, deprecated_member_use
import 'package:firebase_core/firebase_core.dart';
import 'package:mileseducation/view/splash_screen/splash_screen.dart';
import '/common/utils/constrants.dart';
import 'common/constants/commonstring.dart';
import 'common/themes/app_colors.dart';
import 'common/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs.init();
  await SharedPrefs.jwTokenAccount();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  _tokenCode();
  runApp(const ProviderScope(child: App()));
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
}

_tokenCode() async {
  String? token = await SharedPrefs.getJwtoken;
  bool? fingerPrint = false;
  try {
    fingerPrint = await SharedPrefs.getFingerPrint;
  } catch (e) {
    fingerPrint = false;
  }
  jwToken = token;
  biometricfingerprint = fingerPrint!;
  if (token != null) {
    jwToken = await SharedPrefs.getJwtoken;
  } else {
    jwToken = null;
  }
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CommonString.projectFullName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
        appBarTheme: AppBarTheme(
          backgroundColor: appBackGroundColor,
          iconTheme: IconThemeData(color: commonDefaultFont),
        ),
        fontFamily: CommonString.inter,
      ),
      home: const SplashPage(),
    );
  }
}
