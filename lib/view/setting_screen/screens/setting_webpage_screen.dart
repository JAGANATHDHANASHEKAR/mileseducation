// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mileseducation/common/configuration/enum.dart';
import 'package:mileseducation/common/themes/commonButton.dart';
import 'package:mileseducation/common/themes/common_textfield.dart';
import 'package:mileseducation/common/utils/common_function.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../common/constants/commonstring.dart';
import '../../../common/utils/constrants.dart';
import '../../../common/utils/page_route.dart';
import '../../../common/widget/custom_appbar.dart';
import '../api/settings_api_provider.dart';

class WebPageSettingsScreen extends ConsumerStatefulWidget {
  String? webviewContent;
  String? link;

  WebPageSettingsScreen({super.key, required this.webviewContent, this.link});

  @override
  _WebPageSettingsScreenState createState() => _WebPageSettingsScreenState();
}

class _WebPageSettingsScreenState extends ConsumerState<WebPageSettingsScreen> {
  late WebViewController controller;

  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  void _toggleObscure({required bool isNew}) {
    setState(() {
      isNew
          ? obscureNewPassword = !obscureNewPassword
          : obscureConfirmPassword = !obscureConfirmPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.link != null) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(Colors.transparent)
        ..loadRequest(Uri.parse(widget.link!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isChangePassword =
        widget.webviewContent == CommonString.changePassword;

    return Scaffold(
      appBar: CustomAppBar.appBarwithIcon(
        widget.webviewContent ?? "",
        context,
        true,
        () => navigatePop(context),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final settingProvider = ref.watch(settingPageStatus);
          settingProvider.clearPasswordFields();
          return isChangePassword
              ? _buildChangePasswordUI(settingProvider)
              : widget.link != null
              ? WebViewWidget(key: UniqueKey(), controller: controller)
              : const Center(child: Text("Invalid Link"));
        },
      ),
    );
  }

  Widget _buildChangePasswordUI(SettingPageProvider provider) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: provider.settingStatus == Status.networkError
          ? noInternet(context)
          : Column(
              children: [
                const SizedBox(height: 10),
                CommonTextField(
                  labelText: CommonString.currentPassword,
                  controller: provider.currentPasswordController,
                ),
                const SizedBox(height: 10),
                CommonTextField(
                  labelText: CommonString.newPassword,
                  controller: provider.newPasswordController,
                  obscureText: obscureNewPassword,
                  suffixicon: IconButton(
                    icon: Icon(
                      obscureNewPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () => _toggleObscure(isNew: true),
                  ),
                ),
                const SizedBox(height: 10),
                CommonTextField(
                  labelText: CommonString.confirmPassword,
                  controller: provider.confirmPasswordController,
                  obscureText: obscureConfirmPassword,
                  suffixicon: IconButton(
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () => _toggleObscure(isNew: false),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: CommonButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (provider.changePasswordVaildation(context)) {
                        provider.resetPassword(context);
                      }
                    },
                    textarea: CommonString.update,
                    color: mainColor,
                    fontColor: whiteColor,
                  ),
                ),
              ],
            ),
    );
  }
}
