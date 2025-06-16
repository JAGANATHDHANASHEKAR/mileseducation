// ignore_for_file: file_names, sort_child_properties_last, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mileseducation/common/configuration/enum.dart';
import 'package:mileseducation/common/themes/common_dialog_box.dart';
import 'package:mileseducation/common/utils/common_function.dart';
import 'package:mileseducation/common/utils/constrants.dart';
import 'package:mileseducation/view/login_screen/screens/signIn.dart';
import 'package:mileseducation/view/login_screen/utils/login_page_utilis.dart';
import 'package:mileseducation/view/splash_screen/splash_screen.dart';
import '../../../common/constants/commonstring.dart';
import '../../../common/utils/common_text_style.dart';
import '../../../common/utils/custom_divider.dart';
import '../../../common/utils/page_route.dart';
import '../../../common/utils/shared_prefs.dart';
import '../api/settings_api_provider.dart';
import 'setting_webpage_screen.dart';

class SettingsScreenPage extends ConsumerStatefulWidget {
  const SettingsScreenPage({super.key});

  @override
  _SettingsScreenPageState createState() => _SettingsScreenPageState();
}

class _SettingsScreenPageState extends ConsumerState<SettingsScreenPage> {
  Widget _settingRow(String label, {VoidCallback? onTap, Widget? trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: CommonStyle.BlackText14w500()),
        trailing ??
            IconButton(
              iconSize: 14,
              onPressed: onTap,
              icon: const Icon(Icons.arrow_forward_ios),
            ),
      ],
    );
  }

  Widget _sectionHeader(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(label, style: CommonStyle.darkgreyText16w500()),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(CommonString.settings, style: CommonStyle.BlackText16w600()),
            CustomDivider.blackthin(),
            Consumer(
              builder: (context, ref, child) {
                final auth = FirebaseAuth.instance;
                final user = auth.currentUser;
                return Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child:
                        ref.watch(settingPageStatus).settingStatus ==
                            Status.networkError
                        ? noInternet(context)
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Profile
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Text(
                                      "",
                                      style: CommonStyle.greenText12w400(),
                                    ),
                                    radius: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    user != null ? user.email.toString() : "",
                                    style: CommonStyle.BlackText16w500(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              CustomDivider.ThinDivider(),
                              _sectionHeader(CommonString.accountSetting),
                              _settingRow(
                                CommonString.changePassword,
                                onTap: () {
                                  navigatePush(
                                    context,
                                    WebPageSettingsScreen(
                                      webviewContent:
                                          CommonString.changePassword,
                                      link: null,
                                    ),
                                  );
                                },
                              ),

                              _settingRow(
                                CommonString.fingerPrintEnable,
                                trailing: Switch(
                                  value: biometricfingerprint,
                                  activeColor: mainColor,
                                  onChanged: (val) async {
                                    if (val) {
                                      await requestBiometricAuthentication();
                                    }
                                    SharedPrefs.setFingerPrint(val);
                                    setState(() {
                                      biometricfingerprint = val;
                                    });
                                  },
                                ),
                              ),

                              _sectionHeader(CommonString.more),
                              _settingRow(
                                CommonString.aboutUs,
                                onTap: () {
                                  navigatePush(
                                    context,
                                    WebPageSettingsScreen(
                                      webviewContent: CommonString.aboutUs,
                                      link:
                                          "https://www.mileseducation.com/about-us",
                                    ),
                                  );
                                },
                              ),
                              _settingRow(
                                CommonString.policyPrivacy,
                                onTap: () {
                                  navigatePush(
                                    context,
                                    WebPageSettingsScreen(
                                      webviewContent:
                                          CommonString.policyPrivacy,
                                      link:
                                          "https://www.mileseducation.com/privacy",
                                    ),
                                  );
                                },
                              ),
                              _settingRow(
                                CommonString.termsAndConditions,
                                onTap: () {
                                  navigatePush(
                                    context,
                                    WebPageSettingsScreen(
                                      webviewContent:
                                          CommonString.termsAndConditions,
                                      link:
                                          "https://www.mileseducation.com/terms-and-conditions",
                                    ),
                                  );
                                },
                              ),
                              _settingRow(
                                CommonString.logout,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) => CommonDialogBox(
                                      title: CommonString.logout,
                                      description:
                                          CommonString.confirmationLogout,
                                      onPresstext: CommonString.yes,
                                      onCanceltext: CommonString.no,
                                      onPress: () async {
                                        navigatePop(context);
                                        SharedPrefs.logout();
                                        await FirebaseAuth.instance.signOut();
                                        navigateRemoveAllCupertino(
                                          context,
                                          const SignInPageScreen(),
                                        );
                                      },
                                      onCancel: () => Navigator.pop(context),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
