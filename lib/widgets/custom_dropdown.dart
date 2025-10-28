import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';
import '../routes/auto_route_observer.dart';
import 'common_dropdown.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> displayList;
  final String? selected;
  final double? width;
  final String label;
  final bool? isMandatory;
  final void Function(String)? onChanged;

  const CustomDropdown({
    super.key,
    required this.displayList,
    required this.selected,
    this.width,
    required this.label,
    this.isMandatory,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    talker.debug("rebuild custom dropdown with $selected");
    return CommonDropDown(
      shouldDisableDropdown: false,
      selectedValue: selected,
      circularBorder: false,
      borderRadius: 0,
      width: width ?? MediaQuery.of(context).size.width,
      isMandatory: isMandatory ?? false,
      onlyBottomBorder: true,
      leftSideNoBorder: false,
      rightSideNoBorder: false,
      fontSize: AppSizes.fSize12,
      displayList: displayList.map((e) => e.toString()).toSet().toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "${label.tr()} ${AppStrings.requiredField.tr()}";
        }
        return null;
      },
      labelText: label.tr(),
      onChanged: (newValue) {
        if (onChanged != null) {
          onChanged!(newValue);
        }
      },
    );
  }
}

class AppLocal {
}

class CustomDropdownWithoutValidation<T> extends StatelessWidget {
  final List<T> displayList;
  final String? selected;
  final double? width;
  final String label;
  final bool? isMandatory;
  final void Function(String)? onChanged;

  const CustomDropdownWithoutValidation({
    super.key,
    required this.displayList,
    required this.selected,
    this.width,
    required this.label,
    this.isMandatory,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CommonDropDown(
      shouldDisableDropdown: false,
      selectedValue: selected ?? '',

      // Provide a default value
      circularBorder: false,
      borderRadius: 0,
      width: width ?? MediaQuery.of(context).size.width,
      isMandatory: isMandatory ?? false,
      onlyBottomBorder: true,
      leftSideNoBorder: false,
      rightSideNoBorder: false,
      fontSize: AppSizes.fSize12,
      displayList: displayList.map((e) => e.toString()).toSet().toList(),
      labelText: label.tr(),
      validator: (value) {
        if (value != null) {
          return null;
        }
        return null;
      },
      onChanged: (newValue) {
        if (onChanged != null) {
          onChanged!(newValue);
        }
      },
    );
  }
}
