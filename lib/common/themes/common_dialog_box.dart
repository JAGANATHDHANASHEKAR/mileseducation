// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mileseducation/common/themes/commonButton.dart';
import 'package:mileseducation/common/utils/constrants.dart';
import '../utils/common_text_style.dart';
import 'app_colors.dart';

class CommonDialogBox extends StatefulWidget {
  final String title, description;
  final Image? img;
  final VoidCallback onPress;
  final VoidCallback onCancel;
  final String? onPresstext;
  final String? onCanceltext;

  const CommonDialogBox({
    Key? key,
    required this.title,
    required this.description,
    required this.onPress,
    required this.onCancel,
    this.onPresstext,
    this.onCanceltext,
    this.img,
  }) : super(key: key);

  @override
  State<CommonDialogBox> createState() => _CommonDialogBoxState();
}

class _CommonDialogBoxState extends State<CommonDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          constraints: const BoxConstraints(maxWidth: 350),
          margin: const EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 15),
                blurRadius: 30,
                color: const Color(0xFF666666).withOpacity(.11),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 10.0),
                child: Text(widget.title, style: CommonStyle.mainColor16w500()),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 20.0),
                child: Text(
                  widget.description,
                  style: CommonStyle.BlackText14w400(),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonButton(
                        onPressed: widget.onCancel,
                        textarea: widget.onCanceltext != null
                            ? widget.onCanceltext.toString()
                            : "Cancel",
                        color: commonCancelButton,
                        fontColor: commonDefaultFont,
                      ),
                      const SizedBox(width: 10),
                      CommonButton(
                        onPressed: widget.onPress,
                        textarea: widget.onPresstext != null
                            ? widget.onPresstext.toString()
                            : "Ok",
                        color: mainColor,
                        fontColor: commonPrimeColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
