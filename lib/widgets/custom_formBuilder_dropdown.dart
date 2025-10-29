import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:freelance_user/constants/app_strings.dart';
import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../constants/app_sizes.dart';
import '../helper/data_helper.dart';
import 'common_text_widget.dart';

class CustomFormBuilderDropdown extends StatelessWidget {
  final String name;
  final String? label;
  final List<DropDownOption> items;
  final void Function(DropDownOption?)? onChanged;
  final bool readOnly; // New parameter
  final bool isMandatory;
  final void Function()? onTap;
  final bool isCrossRequired;

  const CustomFormBuilderDropdown({
    super.key,
    required this.name,
    required this.items,
    this.onChanged,
    this.label,
    this.onTap,
    this.isCrossRequired = false,
    this.readOnly = false,
    this.isMandatory = false, // Default value is false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label?.tr(),
            style: FormBuilderTextStyle.getFormTextStyle(),
            children: [
              if (isMandatory == true)
                const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        AppSizes.height10,
        FormBuilderDropdown(
          name: name,
          enabled: !readOnly,
          iconSize: readOnly ? 0 : 24.0,
          validator: FormBuilderValidators.compose(
            [
              if (isMandatory == true)
                FormBuilderValidators.required(
                  errorText: "${label?.tr()} ${AppStrings.requiredField.tr()}",
                ),
            ],
          ),
          decoration: InputDecoration(
            fillColor: readOnly == true
                ? AppColors.kcMediumGray1Color.withValues(alpha: 0.2)
                : AppColors.kWhite,
            isDense: true,
            filled: true,
            border: BorderStyles.formBorder,
            enabledBorder: BorderStyles.formBorder,
            focusedBorder: BorderStyles.formBorder,
            disabledBorder: BorderStyles.formBorder,
            errorBorder: BorderStyles.errorFormBorder,
            focusedErrorBorder: BorderStyles.errorFormBorder,
          ),
          items: items
              .map(
                (status) => DropdownMenuItem(
                  value: status,
                  child: CommonTextWidget(
                    text: status.name ?? "-",
                    color: AppColors.kcOrTextColor,
                  ),
                ),
              )
              .toList(),
          icon: Row(
            children: [
              (isCrossRequired && readOnly == false)
                  ? GestureDetector(
                      onTap: onTap, child: Icon(FontAwesomeIcons.x, size: 12))
                  : SizedBox(),
              Image.asset(
                AppImages.downArrow,
                height: AppSizes.fSize20,
                width: AppSizes.fSize20,
              ),
            ],
          ),
          onChanged:
              readOnly ? null : onChanged, // Disable onChanged if readOnly
        ),
      ],
    );
  }
}

class CustomWithoutValidationFormBuilderDropdown extends StatelessWidget {
  final String name;
  final List<DropDownOption> items;
  final void Function(DropDownOption?)? onChanged;
  final bool readOnly; // New parameter

  const CustomWithoutValidationFormBuilderDropdown({
    super.key,
    required this.name,
    required this.items,
    this.onChanged,
    this.readOnly = false, // Default value is false
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      name: name.tr(),
      // enabled: !readOnly,
      iconSize: readOnly ? 0 : 24.0,
      decoration: InputDecoration(
        labelText: name.tr(),
        labelStyle: FormBuilderTextStyle.getFormTextStyle(),
        border: BorderStyles.formBorder,
        enabledBorder: BorderStyles.formBorder,
        focusedBorder: BorderStyles.formBorder,
        errorBorder: BorderStyles.errorFormBorder,
        focusedErrorBorder: BorderStyles.errorFormBorder,
      ),
      items: items
          .map(
            (status) => DropdownMenuItem(
              value: status,
              child: CommonTextWidget(
                text: status.name?.tr() ?? "-",
                color: AppColors.kcOrTextColor,
              ),
            ),
          )
          .toList(),

      onChanged: readOnly ? null : onChanged, // Disable onChanged if readOnly
    );
  }
}
