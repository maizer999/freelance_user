import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class CustomFormBuilderTextField extends StatelessWidget {
  final String name;
  final String label;
  final double? hintFontSize;
  final double? labelFontSize;
  final bool isMandatory;
  final bool isReadOnly;
  final Color? labelColor;
  final Color? fillColor;
  final bool isFilled;
  final TextInputType? keyBoardType;
  final int? maxLength;
  final FontWeight? labelFontWeight;
  final dynamic Function(String?)? valueTransformer;
  final String? Function(String?)? customValidator;

  const CustomFormBuilderTextField({
    super.key,
    required this.name,
    required this.label,
    this.hintFontSize,
    this.labelFontSize,
    this.isReadOnly = false,
    this.labelFontWeight,
    this.maxLength,
    this.keyBoardType,
    this.isMandatory = false,
    this.isFilled = false,
    this.labelColor,
    this.fillColor,
    this.valueTransformer,
    this.customValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            text: label.tr(),
            style: FormBuilderTextStyle.getFormTextStyle(
                hintFontSize: hintFontSize),
            children: [
              if (isMandatory == true)
                const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        AppSizes.height10,
        FormBuilderTextField(
          name: name,
          keyboardType: keyBoardType,
          readOnly: isReadOnly,
          maxLength: maxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style:
              FormBuilderTextStyle.getFormTextStyle(hintFontSize: hintFontSize),
          decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: isReadOnly == true
                  ? AppColors.kcMediumGray1Color.withValues(alpha: 0.2)
                  : AppColors.kWhite,
              border: BorderStyles.formBorder,
              enabledBorder: BorderStyles.formBorder,
              focusedBorder: BorderStyles.formBorder,
              errorBorder: BorderStyles.errorFormBorder,
              focusedErrorBorder: BorderStyles.errorFormBorder,
              errorText: null),
          valueTransformer: valueTransformer,
          validator: customValidator,
        )
      ],
    );
  }
}
