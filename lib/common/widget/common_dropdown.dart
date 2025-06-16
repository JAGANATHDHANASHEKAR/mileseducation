import '/common/themes/app_colors.dart';
import '/common/utils/common_text_style.dart';
import '/common/utils/constrants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CommonDropDown extends StatefulWidget {
  const CommonDropDown({
    super.key,
    this.onChange,
    this.readOnly = false,
    this.autofocus = true,
    this.showSearchBox = true,
    this.selectedItem,
    required this.items,
    this.width,
    this.validator,
    this.requiredfield = false,
    this.labeltext,
    this.onTap,
    this.asyncItems, // New asyncItems parameter
  });

  final Function(String?)? onChange;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool autofocus;
  final bool showSearchBox;
  final String? selectedItem;
  final List<String> items;
  final double? width;
  final bool requiredfield;
  final String? labeltext;
  final Function()? onTap;
  final Future<List<String>> Function(String)? asyncItems;

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  var border = OutlineInputBorder(
    borderSide: BorderSide(width: 0.5, color: commonBorder),
  );

  var errorBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 0.5, color: commonfailureMessage),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labeltext != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: RichText(
              text: TextSpan(
                text: widget.labeltext!,
                style: CommonStyle.MainText14w400(),
                children: [
                  widget.requiredfield
                      ? TextSpan(
                          text: "  *",
                          style: TextStyle(color: commonfailureMessage),
                        )
                      : const TextSpan(text: ""),
                ],
              ),
            ),
          ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              bottomLeft: Radius.circular(2),
            ),
            color: widget.requiredfield ? redColor : whiteColor,
          ),
          padding: widget.requiredfield
              ? const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0)
              : const EdgeInsets.all(0),
          child: Container(
            color: whiteColor,
            child: SizedBox(
              width: widget.width,
              child: DropdownSearch<String>(
                asyncItems: widget.asyncItems,
                validator: widget.validator,
                enabled: !widget.readOnly,
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  searchFieldProps: TextFieldProps(
                    onTap: () => widget.onTap,
                    autofocus: widget.autofocus,
                    padding: widget.requiredfield
                        ? const EdgeInsets.fromLTRB(0.0, 4.0, 4.0, 4.0)
                        : const EdgeInsets.all(4),
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle: CommonStyle.BlackText12w400(),
                      enabledBorder: border,
                      border: border,
                      errorBorder: errorBorder,
                      focusedBorder: border,
                      disabledBorder: border,
                      focusedErrorBorder: errorBorder,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                  showSearchBox: widget.showSearchBox,
                  fit: FlexFit.loose,
                  isFilterOnline: true,
                ),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    isDense: true,
                    enabledBorder: border,
                    border: border,
                    errorBorder: errorBorder,
                    fillColor: widget.readOnly ? Colors.grey.shade100 : null,
                    filled: widget.readOnly,
                    focusedBorder: border,
                    disabledBorder: border,
                    focusedErrorBorder: errorBorder,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    constraints: BoxConstraints.loose(
                      const Size.fromHeight(30),
                    ),
                  ),
                ),
                dropdownButtonProps: const DropdownButtonProps(
                  splashRadius: 16,
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  iconSize: 18,
                ),
                onChanged: widget.onChange,
                dropdownBuilder: (context, selectedItem) {
                  return Text(
                    selectedItem ?? '',
                    style: CommonStyle.BlackText12w400(),
                    overflow: TextOverflow.ellipsis,
                  );
                },
                selectedItem: widget.selectedItem,
                items: widget.items,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
