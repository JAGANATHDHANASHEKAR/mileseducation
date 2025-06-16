import 'package:mileseducation/common/utils/constrants.dart';

import '../utils/common_text_style.dart';
import 'package:flutter/material.dart';

class CommonPopupMenu extends StatefulWidget {
  const CommonPopupMenu({
    super.key,
    required this.menuItems,
    required this.iconsData,
    this.enabled = true,
    this.iconSize = 18,
    this.iconColor,
    this.onSelect,
  });

  final List<String> menuItems;
  final List<IconData> iconsData;
  final bool enabled;
  final double iconSize;
  final Color? iconColor;
  final void Function(dynamic)? onSelect;

  @override
  State<CommonPopupMenu> createState() => _CommonPopupMenuState();
}

class _CommonPopupMenuState extends State<CommonPopupMenu> {
  double radius = 10;
  late BorderRadiusGeometry borderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: const EdgeInsets.all(0),
      color: widget.iconColor,
      iconSize: widget.iconSize,
      splashRadius: 4,
      enabled: widget.enabled,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      itemBuilder: (context) {
        return _menuItems();
      },
      onSelected: widget.onSelect,
    );
  }

  _menuItems() {
    return List.generate(
      widget.menuItems.length,
      (index) => PopupMenuItem<int>(
        value: index,
        child: Row(
          children: [
            Icon(widget.iconsData[index], size: 12, color: mainColor),
            const SizedBox(width: 5.0),
            Text(widget.menuItems[index], style: CommonStyle.MainText12w400()),
          ],
        ),
      ),
    );
  }
}
