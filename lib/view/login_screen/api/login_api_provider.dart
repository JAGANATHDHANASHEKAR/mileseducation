import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mileseducation/common/configuration/enum.dart';
import 'package:mileseducation/common/constants/commonstring.dart';
import 'package:mileseducation/common/constants/internetConnection.dart';
import 'package:mileseducation/common/utils/common_function.dart';
import 'package:mileseducation/common/utils/page_route.dart';
import 'package:mileseducation/common/utils/shared_prefs.dart';
import 'package:mileseducation/common/utils/toast_message.dart';
import 'package:mileseducation/view/dashBoard_screen/screens/dashBoard_page.dart';
import 'package:mileseducation/view/login_screen/utils/login_page_utilis.dart';

final loginPageStatus = ChangeNotifierProvider<LoginPageProvider>(
  (ref) => LoginPageProvider(),
);

class LoginPageProvider extends ChangeNotifier {
  Status loginStatus = Status.loading;

  // TextEditing Controller
  TextEditingController loginPassword = TextEditingController();
  TextEditingController loginConfirmPassword = TextEditingController();
  TextEditingController loginEmail = TextEditingController();

  // vaildation
  bool loginValidate(BuildContext context, bool signUpPage) {
    if (loginEmail.text.isEmpty) {
      showToast(context, CommonString.emailRequired.toString());
      notifyListeners();
      return false;
    }
    // Validate email format
    else if (!isValidEmail(loginEmail.text.trim())) {
      showToast(context, CommonString.vaildEmail);
      notifyListeners();
      return false;
    } else if (loginPassword.text.isEmpty) {
      showToast(context, CommonString.passwordRequired.toString());
      notifyListeners();
      return false;
    }
    if (signUpPage) {
      // Confirm password checks
      if (loginConfirmPassword.text.isEmpty) {
        showToast(context, CommonString.pleaseConfirmPassword);
        notifyListeners();
        return false;
      } else if (loginPassword.text != loginConfirmPassword.text) {
        showToast(context, CommonString.verifyPasswords);
        notifyListeners();
        return false;
      }
    }

    return true; // All validations passed
  }

  // Register with
  Future<void> registerWithEmail(BuildContext context) async {
    showProgress(context);
    if (!await Connection.isConnected()) {
      loginStatus = Status.networkError;
      showToast(context, CommonString.noInternet);
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: loginEmail.text.trim(),
        password: loginPassword.text.trim(),
      );
      loginStatus = Status.successful;
      showToastSucess(context, CommonString.registrationSuccessful);
      closeProgress(context);
      clearFields(context);
      Navigator.pop(context); // Go back to login screen
    } on FirebaseAuthException catch (e) {
      loginStatus = Status.error;
      closeProgress(context);
      showToast(context, e.message ?? CommonString.registrationFailed);
    }
  }

  Future<void> loginWithEmail(BuildContext context) async {
    loginStatus = Status.loading;
    if (!await Connection.isConnected()) {
      loginStatus = Status.networkError;
      showToast(context, CommonString.noInternet);
      notifyListeners();
      return;
    }
    try {
      loginStatus = Status.loading;
      notifyListeners();
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: loginEmail.text.trim(),
            password: loginPassword.text.trim(),
          );
      if (userCredential.user != null) {
        showToastSucess(context, CommonString.loginSuccesful);
        loginStatus = Status.successful;
        notifyListeners();
        SharedPrefs.setJWToken(loginEmail.text.toString());
        SharedPrefs.setUserName(loginEmail.text.toString());
        clearFields(context);
        await requestBiometricAuthentication();
        navigateRemoveAllCupertino(context, DashBoardPage(selectedIndex: 0));
      }
    } on FirebaseAuthException catch (e) {
      loginStatus = Status.error;
      notifyListeners();
      
      showToast(context, CommonString.loginFailed);
    }
  }

  clearFields(context) {
    loginEmail = TextEditingController();
    loginPassword = TextEditingController();
    loginConfirmPassword = TextEditingController();
  }
}
