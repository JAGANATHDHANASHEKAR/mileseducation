// import '/main.dart';
// import '/utils/page_route.dart';
// import '/utils/shared_prefs.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../themes/app_colors.dart';
// import '../themes/textstyles.dart';

// class CommonSideMenu extends StatefulWidget {
//   final int selectedIndex;
//   const CommonSideMenu({
//     Key? key,
//     required this.selectedIndex,
//   }) : super(key: key);

//   @override
//   State<CommonSideMenu> createState() => _CommonSideMenuState();
// }

// class _CommonSideMenuState extends State<CommonSideMenu> {
//   List<Map<String, dynamic>> navItemData = [
//     {
//       'leadingIcon': Icons.qr_code_2,
//       'title': 'FG Barcode',
//       'url': AppScreens.fgBarcodescreen,
//     },
//     {
//       'leadingIcon': Icons.print,
//       'title': 'Print Barcode',
//       'url': AppScreens.barcodeScreen,
//     },
//     {
//       'leadingIcon': Icons.delivery_dining,
//       'title': CommonString.salesDelivery,
//       'url': AppScreens.salesDelivery,
//     },
//     {
//       'leadingIcon': Icons.scale,
//       'title': CommonString.weightScale,
//       'url': AppScreens.weighScale,
//     },
//     {
//       'leadingIcon': Icons.paste_rounded,
//       'title': 'Gate Pass',
//       'url': AppScreens.gatePass,
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//   }

//   List<Map<String, dynamic>> navItemDataMobile = [
//     {
//       'leadingIcon': Icons.approval_rounded,
//       'title': 'Approval',
//       'url': 'mc/approval'
//     },
//     {
//       'leadingIcon': Icons.list,
//       'title': 'Issue',
//       'url': 'mc/issue',
//     },
//     {
//       'leadingIcon': Icons.stacked_bar_chart,
//       'title': 'Stock-Receipt',
//       'url': 'mc/stockreceipt',
//     },
//     {
//       'leadingIcon': Icons.dns_outlined,
//       'title': 'Subcont. Receipt',
//       'url': 'mc/subconreceipt',
//     },
//     {
//       'leadingIcon': Icons.production_quantity_limits,
//       'title': 'BY-Product',
//       'url': 'mc/byProduct',
//     },
//     {
//       'leadingIcon': Icons.monitor_weight,
//       'title': 'Avg-Weight',
//       'url': 'mc/avgWeight',
//     },
//   ];

//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Consumer<IssuePageProvider>(builder: (context, provider, _) {
//         return LayoutBuilder(builder: (context, constraints) {
//           return Drawer(
//             backgroundColor: appBackGroundColor,
//             elevation: 0.0,
//             child: Stack(
//               alignment: Alignment.bottomLeft,
//               children: [
//                 Column(
//                   children: [
//                     sideMenuHeader(context),
//                     const SizedBox(height: 10),
//                     ...sideMenuItems(
//                       context: context,
//                       itemData: CommonResponsive.isWeb(context)
//                           ? navItemData
//                           : navItemDataMobile,
//                       provider: provider,
//                     ),
//                     const Spacer(),
//                     const Text(
//                       "Version No: 1.0",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                   ],
//                 ),
//                 if (CommonResponsive.isMobile(context))
//                   Material(
//                     elevation: 3.0,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(8),
//                           topRight: Radius.circular(8),
//                         ),
//                         color: Colors.white,
//                       ),
//                       child: ListTile(
//                         onTap: () async {
//                           await SharedPrefs.logout();
//                           navigateRemoveAllCupertino(context, Login());
//                         },
//                         title: Text(
//                           "Logout",
//                           style: regular.copyWith(color: Colors.red),
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           );
//         });
//       }),
//     );
//   }

//   Widget getWidgetBased(int selectedIndex, BoxConstraints constraints) {
//     if (selectedIndex == 0) {
//       return const IssueRootScreen();
//     } else if (selectedIndex == 1) {
//       return const StockReceeiptRootScreen();
//     } else if (selectedIndex == 2) {
//       return const SubCOnReceiptRoot();
//     } else if (selectedIndex == 3) {
//       return const ByProductRootScreen();
//     } else {
//       return const AvGWeightRootScreen();
//     }
//   }

//   sideMenuHeader(BuildContext context) {
//     if (CommonResponsive.isWeb(context)) {
//       return Container(
//         margin: const EdgeInsets.only(top: 16),
//         child: Column(
//           children: [
//             Center(
//               child: Image.asset(
//                 'assets/images/murugan-logo.jpg',
//                 fit: BoxFit.contain,
//                 width: 150,
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             children: [
//               const Text('Murugan Metals'),
//               const Spacer(),
//               IconButton(
//                 onPressed: () => Navigator.pop(context),
//                 icon: const Icon(
//                   Icons.close_rounded,
//                 ),
//               )
//             ],
//           ),
//         ),
//         Divider(
//           color: CommonDividerLine,
//           height: 0.2,
//           thickness: 0.2,
//         ),
//       ],
//     );
//   }

//   sideMenuItems({context, itemData, provider}) {
//     final p1 = Provider.of<IssuePageProvider>(context, listen: false);
//     List<Widget> menuItems = [];
//     for (int i = 0; i < itemData.length; i++) {
//       menuItems.add(
//         ListTile(
//           horizontalTitleGap: 10,
//           tileColor: p1.selectedIndex == i ? CommonActiveCursor : Colors.white,
//           minLeadingWidth: 10,
//           leading: Icon(
//             itemData[i]['leadingIcon'],
//             size: 20,
//             color: p1.selectedIndex == i ? CommonScaffold : Colors.black,
//           ),
//           title: Text(
//             itemData[i]['title'],
//             style: p1.selectedIndex == i
//                 ? const TextStyle(color: Colors.white)
//                 : regular,
//           ),
//           trailing: Icon(
//             Icons.arrow_forward_ios_rounded,
//             size: 16,
//             color: p1.selectedIndex == i ? Colors.white : Colors.black,
//           ),
//           onTap: () {
//             p1.changeindex(i);
//             if (CommonResponsive.isMobile(context)) {
//               Navigator.pop(context);
//             }
//             Navigator.pushNamedAndRemoveUntil(
//                     context, itemData[i]['url'], (r) => false)
//                 .then((value) => (r) => false);
//           },
//         ),
//       );
//     }
//     return menuItems;
//   }
// }
