// ignore_for_file: must_be_immutable, file_names, deprecated_member_use
import 'dart:async';
import 'package:mileseducation/common/utils/constrants.dart';
import 'package:mileseducation/view/home_screen/screens/homepage_screen.dart';
import 'package:mileseducation/view/setting_screen/screens/settings_page_screen.dart';
import '../../../common/constants/commonstring.dart';
import '../utils/dashBoard_utilis.dart';
import '../../../common/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  int? selectedIndex;
  String? totalActivity;
  String? todayActivity;
  String? customerId;
  DashBoardPage({
    Key? key,
    required this.selectedIndex,
    this.totalActivity,
    this.todayActivity,
    this.customerId,
  }) : super(key: key);
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  // Extra Parameter
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();

  List<String> text = [];
  List<IconData> iconsDataList = [];
  List<Widget> pages = [];
  late int selectIndex = widget.selectedIndex!;

  @override
  void initState() {
    super.initState();
    requestMediaPermissions();
    getCurrentLocation(context);
    loadMenuItems();
  }

  String? datameta = ""; // Page change  to another page for drawer

  Future<void> loadMenuItems() async {
    List<String> allText = [CommonString.home, CommonString.settings];

    List<IconData> allIconsDataList = [Icons.home, Icons.settings];

    List<Widget> allPages = [
      const HomeScreenPage(),
      const SettingsScreenPage(),
    ];

    List<String> filteredText = [];
    List<IconData> filteredIcons = [];
    List<Widget> filteredPages = [];

    for (int i = 0; i < allText.length; i++) {
      filteredText.add(allText[i]);
      filteredIcons.add(allIconsDataList[i]);
      filteredPages.add(allPages[i]);
    }

    setState(() {
      text = filteredText;
      iconsDataList = filteredIcons;
      pages = filteredPages;
    });
  }

  // Once u reach to other Page finally it will come to Homepage function.
  Future<bool> _onWillPop() async {
    if (selectIndex != 0) {
      setState(() {
        selectIndex = 0;
        _pageController.jumpToPage(selectIndex);
        if (selectIndex != 7) {
          setState(() {
            widget.customerId = "";
          });
        }
        // Conditionally set totalActivity
        if (widget.selectedIndex == 3) {
          // Do nothing, keep widget.totalActivity as-is
        } else {
          setState(() {
            widget.totalActivity = "no";
            widget.todayActivity = "no";
          });
        }
      });
      return Future.value(false);
    } else {
      bool exitApp = await showExitDialog(context);
      return exitApp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar.commonAppBarWidget(
            context,
            _scaffoldKey,
          ), // AppBar was written in CommonWidget
          drawer: datameta != "0" ? drawList() : Container(),
          body: Row(
            children: [datameta == "2" ? keyList() : Container(), valueList()],
          ),
        ),
      ),
    );
  }

  Widget keyList() {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 0.0);
          },
          itemCount: text.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectIndex = index;
                  _pageController.jumpToPage(selectIndex);
                  if (selectIndex != 7) {
                    setState(() {
                      widget.customerId = "";
                    });
                  }
                });
              },
              child: SizedBox(
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(microseconds: 500),
                      height: (selectIndex == index) ? 0 : 0,
                      width: 0,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.all(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side: const BorderSide(color: Colors.white),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          color: (selectIndex == index)
                              ? Colors.blue
                              : Colors.white,
                          height: 55.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0.0,
                              horizontal: 0.0,
                            ),
                            child: Column(
                              children: [
                                Icon(iconsDataList[index]),
                                const SizedBox(height: 5.0),
                                Text(text[index]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget drawList() {
    return Drawer(
      width: 80,
      child: Container(
        color: Colors.white,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 0.0);
          },
          itemCount: text.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectIndex = index;
                  _pageController.jumpToPage(selectIndex);
                  if (selectIndex != 7) {
                    setState(() {
                      widget.customerId = "";
                    });
                  }
                  Navigator.pop(context);
                });
              },
              child: SizedBox(
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(microseconds: 500),
                      height: (selectIndex == index) ? 0 : 0,
                      width: 0,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              10.0,
                              12.0,
                              10.0,
                              10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      iconsDataList[index],
                                      size: 22,
                                      color: (selectIndex == index)
                                          ? mainColor
                                          : Colors.grey.shade500,
                                    ),
                                    const SizedBox(height: 5.0),
                                    Center(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          text[index],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: (selectIndex == index)
                                                ? mainColor
                                                : Colors.grey.shade500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget valueList() {
    return Expanded(
      flex: 6,
      child: PageView(controller: _pageController, children: [widgetAlign()]),
    );
  }

  Widget widgetAlign() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        if (text[selectIndex] == CommonString.home.toString()) {
          return HomeScreenPage();
        } else {
          return SettingsScreenPage();
        }
      },
    );
  }
}
