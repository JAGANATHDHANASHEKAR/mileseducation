// import '/view/mapScreen/screens/googleMap_screen.dart';
// import '/view/mapScreen/screens/map_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mileseducation/common/constants/commonstring.dart';
import 'package:mileseducation/common/themes/common_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:mileseducation/view/login_screen/screens/signIn.dart';
import '../utils/common_text_style.dart';
import '../utils/constrants.dart';
import '../utils/page_route.dart';
import '../utils/shared_prefs.dart';

class CustomAppBar {
  static commonAppBarWidget(context, GlobalKey<ScaffoldState> scaffoldKey) {
    return AppBar(
      elevation: 1,
      titleSpacing: 0,
      shadowColor: thinDividerColor,
      backgroundColor: appBackGroundColor,
      title: Container(
        color: whiteColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 0.0, 8.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Card(
                  color: mainColor,
                  elevation: 2,
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.menu, color: whiteColor),
                  ),
                ),
              ),
              Image.asset(
                "assets/images/logo.png",
                alignment: Alignment.center,
                width: 160,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => CommonDialogBox(
                        title: CommonString.logout,
                        description: CommonString.confirmationLogout,
                        onPress: () async {
                          navigatePop(context);
                          SharedPrefs.logout();
                          await FirebaseAuth.instance.signOut();
                          navigateRemoveAllCupertino(
                            context,
                            const SignInPageScreen(),
                          );
                        },
                        onCancel: () {
                          navigatePop(context);
                        },
                      ),
                    );
                  },
                  child: const SizedBox(
                    height: 20,
                    width: 20,
                    child: Icon(Icons.logout_rounded),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      titleTextStyle: CommonStyle.BlackText20w700(),
      automaticallyImplyLeading: false,
    );
  }

  static appBarwithIcon(
    String title,
    context,
    bool? icondata,
    VoidCallback? onpresseddata,
  ) {
    return AppBar(
      elevation: 1,
      titleSpacing: 0,
      shadowColor: thinDividerColor,
      backgroundColor: mainColor,
      leading: icondata == true
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 13.0,
                color: whiteColor,
              ),
              onPressed: onpresseddata,
            )
          : const SizedBox(),
      leadingWidth: icondata == true ? 50.0 : 0.0,
      title: icondata == true
          ? Text(title, style: CommonStyle.WhiteText16w600())
          : Center(child: Text(title, style: CommonStyle.WhiteText16w600())),
    );
  }
}
