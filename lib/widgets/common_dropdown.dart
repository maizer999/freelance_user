import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';
import '../routes/auto_route_observer.dart';
import 'common_text_widget.dart';

class CommonDropDown extends StatefulWidget {
  final String? labelText;
  final String? Function(String?)? validator;
  final bool shouldDisableDropdown;
  final double? borderRadius;
  final int? elevation;
  final double? fontSize;
  final bool? isMandatory;
  final double? height, width, borderWidth;
  final Function(String)? onChanged;
  final Color? dropDownColor, bgColor, textColor, selectedValueColor;
  final bool circularBorder;
  final bool onlyBottomBorder;
  final bool rightSideNoBorder;
  final bool leftSideNoBorder;
  final String? selectedValue;
  final List<String> displayList;

  const CommonDropDown({
    super.key,
    this.labelText,
    this.validator,
    required this.shouldDisableDropdown,
    this.borderRadius,
    this.elevation,
    this.fontSize,
    this.isMandatory,
    this.height,
    this.width,
    this.borderWidth,
    this.onChanged,
    this.dropDownColor,
    this.bgColor,
    this.textColor,
    this.selectedValueColor,
    required this.circularBorder,
    required this.onlyBottomBorder,
    required this.rightSideNoBorder,
    required this.leftSideNoBorder,
    required this.selectedValue,
    required this.displayList,
  });

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  InputBorder _determineBorder() {
    if (widget.circularBorder) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 13),
        borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5)),
      );
    } else if (widget.onlyBottomBorder) {
      return UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5)),
      );
    } else if (widget.rightSideNoBorder) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(widget.borderRadius ?? 8),
          bottomRight: Radius.circular(widget.borderRadius ?? 8),
        ),
        borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5)),
      );
    } else if (widget.leftSideNoBorder) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.borderRadius ?? 8),
          bottomLeft: Radius.circular(widget.borderRadius ?? 8),
        ),
        borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5)),
      );
    } else {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
        borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5)),
      );
    }
  }

  void setSelected(String? value) {}

  bool checkForValueValidation() {
    return widget.displayList.contains(widget.selectedValue);
  }

  @override
  void initState() {
    super.initState();

    // Ensure selected value is valid after build
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: widget.dropDownColor ?? AppColors.kWhite,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.kWhite,
        ),
        child: DropdownButtonFormField<String>(
          icon: const Icon(Icons.arrow_drop_down_sharp),
          isExpanded: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            filled: true,
            label: widget.isMandatory == true
                ? RichText(
                    text: TextSpan(
                      text: widget.labelText,
                      style: TextStyle(
                        fontFamily: AppStrings.fontFamilyName,
                        fontSize: widget.fontSize ?? AppSizes.fSize12,
                        color: AppColors
                            .kcBlackColor, // Black color for label text
                      ),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            color: AppColors.kRed, // Red color for asterisk
                          ),
                        ),
                      ],
                    ),
                  )
                : Text(
                    widget.labelText ?? "",
                    style: TextStyle(
                      fontFamily: AppStrings.fontFamilyName,
                      fontSize: widget.fontSize ?? AppSizes.fSize12,
                      color: widget.textColor ?? AppColors.kcBlackColor,
                    ),
                  ),
            fillColor: widget.bgColor ?? AppColors.kWhite,
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSizes.hSize4,
              horizontal: AppSizes.wSize10,
            ),
            border: _determineBorder(),
            enabledBorder: _determineBorder(),
            focusedBorder: _determineBorder(),
            errorBorder: _determineBorder(),
          ),
          style: TextStyle(fontSize: widget.fontSize ?? AppSizes.fSize12),
          isDense: true,
          onChanged: !widget.shouldDisableDropdown
              ? (value) {
                  setSelected(value);
                  if (widget.onChanged != null) {
                    if (value != null) {
                      widget.onChanged!(value);
                    } else {
                      talker.debug("onchanged dropdown value $value");
                    }
                  }
                }
              : null,
          validator: (value) =>
              widget.validator != null ? widget.validator!(value) : null,
          items: widget.displayList.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SizedBox(
                height: AppSizes.hSize20,
                child: CommonTextWidget(
                  text: value,
                  color: AppColors.kcBlackColor,
                  fontSize: widget.fontSize ?? AppSizes.fSize12,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
