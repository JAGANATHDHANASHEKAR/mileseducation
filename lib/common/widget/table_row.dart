import 'package:flutter/material.dart';
import '/common/utils/common_text_style.dart';

TableRow buildAlignedRow(String key, String value, {bool isTag = false}) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(key.toUpperCase(), style: CommonStyle.darkgreyText12w400()),
      ),
      const Text(":", style: TextStyle(fontWeight: FontWeight.bold)),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: isTag && value.isNotEmpty
            ? Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue.shade100,
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: Text(value, style: CommonStyle.blueliteText12w400()),
                  ),
                ],
              )
            : Text(value, style: CommonStyle.BlackText12w500()),
      ),
    ],
  );
}
