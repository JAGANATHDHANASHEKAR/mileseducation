// ignore_for_file: file_names, avoid_print
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mileseducation/common/themes/commonButton.dart';
import 'package:mileseducation/common/themes/common_textfield.dart';
import 'package:mileseducation/common/utils/page_route.dart';
import 'package:mileseducation/common/widget/common_responsive.dart';
import 'package:mileseducation/view/login_screen/api/login_api_provider.dart';
import 'package:mileseducation/view/login_screen/screens/signUp.dart';
import '/common/utils/constrants.dart';
import '../../../common/constants/commonstring.dart';
import '../../../common/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SignInPageScreen extends ConsumerStatefulWidget {
  const SignInPageScreen({super.key});

  @override
  _SignInPageScreenState createState() => _SignInPageScreenState();
}

class _SignInPageScreenState extends ConsumerState<SignInPageScreen>
    with TickerProviderStateMixin {
  bool _obscureText = true;
  String? password = "";
  String? mToken = '';

  @override
  void initState() {
    super.initState();
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackGroundColor,
        body: Consumer(
          builder: (context, ref, child) {
            TextEditingController loginPassword = ref
                .watch(loginPageStatus)
                .loginPassword;
            TextEditingController loginEmail = ref
                .watch(loginPageStatus)
                .loginEmail;
            return Center(
              child: SizedBox(
                width: CommonResponsive.isMobile(context)
                    ? size.width
                    : size.width / 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Image.asset(
                          "assets/images/logo.png",
                          alignment: Alignment.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        CommonString.signIn,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: commonDefaultFont,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      CommonTextField(
                        requiredfield: false,
                        labelText: CommonString.email,
                        controller: loginEmail,
                      ),
                      const SizedBox(height: 15.0),
                      CommonTextField(
                        requiredfield: false,
                        labelText: CommonString.password,
                        controller: loginPassword,
                        obscureText: _obscureText,
                        suffixicon: GestureDetector(
                          onTap: _toggle,
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      CommonButton(
                        onPressed: () async {
                          final provider = ref.read(loginPageStatus);
                          bool validation = provider.loginValidate(
                            context,
                            false,
                          );
                          if (validation) {
                            await provider.loginWithEmail(context);
                          }
                        },
                        textarea: CommonString.signIn,
                        fontWeight: FontWeight.w600,
                        color: mainColor,
                        fontColor: commonPrimeColor,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CommonButton(
                            onPressed: () async {
                              ref.watch(loginPageStatus).clearFields(context);
                              navigate(context, SignUpPageScreen());
                            },
                            textarea: CommonString.register,
                            fontWeight: FontWeight.w600,
                            color: commonPrimeColor,
                            fontColor: mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        CommonString.poweredBy,
                        style: TextStyle(color: commonBorder),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
