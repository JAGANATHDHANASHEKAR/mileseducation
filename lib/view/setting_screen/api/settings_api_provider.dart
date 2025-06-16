import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mileseducation/common/configuration/enum.dart';
import 'package:mileseducation/common/constants/commonstring.dart';
import 'package:mileseducation/common/constants/internetConnection.dart';
import 'package:mileseducation/common/utils/common_function.dart';
import 'package:mileseducation/common/utils/page_route.dart';
import 'package:mileseducation/common/utils/toast_message.dart';

final settingPageStatus = ChangeNotifierProvider<SettingPageProvider>(
  (ref) => SettingPageProvider(),
);

class SettingPageProvider extends ChangeNotifier {
  Status settingStatus = Status.loading;

  // TextEditing Controller
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool changePasswordVaildation(BuildContext context) {
    if (currentPasswordController.text.isEmpty) {
      showToast(context, CommonString.currentPasswordRequired);
      notifyListeners();
      return false;
    }

    if (newPasswordController.text.isEmpty) {
      showToast(context, CommonString.newPasswordRequired);
      notifyListeners();
      return false;
    }

    if (confirmPasswordController.text.isEmpty) {
      showToast(context, CommonString.pleaseConfirmPassword);
      notifyListeners();
      return false;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      showToast(
        context,
        CommonString.verifyPasswords,
      ); // Passwords do not match
      notifyListeners();
      return false;
    }

    return true;
  }

  Future<void> resetPassword(BuildContext context) async {
    settingStatus = Status.loading;
    if (!await Connection.isConnected()) {
      settingStatus = Status.networkError;
      notifyListeners();
      return;
    }
    showProgress(context);
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user == null || user.email == null) {
      showToast(context, "No user logged in");
      return;
    }
    final currentPassword = currentPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    try {
      //  Step 1: Re-authenticate the user
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      settingStatus = Status.successful;
      await user.reauthenticateWithCredential(credential);
      //  Step 2: Update the password
      await user.updatePassword(newPassword);
      showToastSucess(context, CommonString.passwordUpdatedSuccess);
      clearPasswordFields(); // Optional: clear your TextEditingControllers
      closeProgress(context);
      navigatePop(context);
    } on FirebaseAuthException catch (e) {
      closeProgress(context);

      if (e.code == 'invalid-credential') {
        showToast(context, CommonString.incorrectPassword);
      } else {
        showToast(context, e.message ?? CommonString.failedToUpdatePassword);
      }
    }
  }

  clearPasswordFields() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  } // Optional: clear your TextEditingControllers
}
