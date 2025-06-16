// ignore_for_file: deprecated_member_use
import 'package:mileseducation/view/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;
  // Get SharedPreferences instance
  static late SharedPreferences permissionprefs;
  static SharedPreferences? _jwTokenPreferences;

  static setToken(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", value);
  }

  static setUserName(String value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("GETUSERNAME", value);
  }

  static setAPIInterval(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("GETAPIINTERVAL", value);
  }

  static setTokenExpiryTime(int value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("tokenExpiryTime", value);
  }

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    permissionprefs = await SharedPreferences.getInstance();
  }

  static jwTokenAccount() async {
    _jwTokenPreferences = await SharedPreferences.getInstance();
    String? data = _jwTokenPreferences?.getString("jwToken");
    if (data != null) jwToken = data;
  }

  static setJWToken(String jwTokendata) async {
    jwToken = jwTokendata;
    return _jwTokenPreferences!.setString("jwToken", jwTokendata);
  }

  static setFingerPrint(bool fingerPrint) async {
    biometricfingerprint = fingerPrint;
    return _jwTokenPreferences!.setBool("fingerPrint", fingerPrint);
  }

  static Future<String?> get getJwtoken async {
    return _jwTokenPreferences!.getString("jwToken");
  }

  static Future<bool?> get getFingerPrint async {
    return _jwTokenPreferences!.getBool("fingerPrint");
  }

  static logout() async {
    jwToken = null;
    _jwTokenPreferences!.clear();
  }

  static Future<bool> setIsLoggedIn(bool isLoggedIn) async =>
      await prefs.setBool("IS_LOGGED_IN", isLoggedIn);

  static setLoginUsername(String username) =>
      prefs.setString("USERNAME", username);
  static setUserId(String userId) => prefs.setString("USERID", userId);
  static setPassword(String password) => prefs.setString("Password", password);

  static bool isLoggedIn() {
    return prefs.getBool("IS_LOGGED_IN") ?? false;
  }

  static Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token") ?? "";
  }

  static Future<String> getUserName() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString("GETUSERNAME") ?? "";
  }

  static Future<int> getApiInterval() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("GETAPIINTERVAL") ?? 0;
  }

  static Future<int> getTokenExpiryTime() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("tokenExpiryTime") ??
        DateTime.now().millisecondsSinceEpoch;
  }

  static String get expiry => prefs.getString("LOGIN_EXPIRY") ?? "";
  static String get username => prefs.getString("USERNAME") ?? "";
  static String get userId => prefs.getString("USERID") ?? "";
  static String get password => prefs.getString("Password") ?? "";
}
