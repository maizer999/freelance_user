import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../constants/app_colors.dart';
import '../theme/style.dart';
import 'common_text_widget.dart';

class CommonInputFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String placeholder;
  final bool readOnly;
  final String? label;
  final Color? labelColor;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final String? hintText;
  final Color? hintColor;
  final String? counterText;
  final TextStyle? labelStyle;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final bool enabled;
  final bool righSideNoBorder;
  final bool leftSideNoBorder;
  final bool circularBoder;
  final TextStyle? textStyle;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final int? maxLength;
  final int minLines;
  final int maxLines;
  final Color borderColor;
  final Color enabledBorderColor;
  final Color errorBorderColor;
  final Color focusedBorderColor;
  final Color fillColor;

  final bool skeletonLoading;
  final void Function()? onTap;
  final void Function()? trailingTapped;
  final TextCapitalization textCapitalization;
  final bool onlyBottomBorder;
  final List<TextInputFormatter> additionalInputFormatters;
  final Function(String)? onChange;
  final Color textColor;
  final FocusNode? focusNode;
  final Color? cursorColor;
  final FormFieldValidator<String>? validator;

  final noBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
  );

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(13),
  );

  final rightCircularBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
  );

  final leftCircularBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
    ),
  );
  final bottomUnderlineBorder = const UnderlineInputBorder();

  CommonInputFormField({
    super.key,
    this.readOnly = false,
    this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.password = false,
    this.trailingTapped,
    this.enabled = true,
    this.righSideNoBorder = false,
    this.leftSideNoBorder = false,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.hintText,
    this.hintColor = AppColors.kcDarkGray2Color,
    this.maxLength,
    this.textAlign = TextAlign.left,
    this.borderColor = AppColors.kcMediumGray1Color,
    this.enabledBorderColor = AppColors.kcMediumGray1Color,
    this.errorBorderColor = Colors.red,
    this.focusedBorderColor = AppColors.kPrimaryLight,
    this.label,
    this.labelColor,
    this.labelFontSize,
    this.labelFontWeight,
    this.labelStyle,
    this.onTap,
    this.fillColor = AppColors.kWhite,
    this.circularBoder = true,
    this.minLines = 1,
    this.maxLines = 1,
    this.skeletonLoading = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.onlyBottomBorder = false,
    this.additionalInputFormatters = const [],
    this.onChange,
    this.textColor = AppColors.kPrimaryLight,
    this.focusNode,
    this.validator,
    this.counterText,
    this.cursorColor = AppColors.kPrimaryLight,
  });

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    final textDirection =
        locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 9.0),
            child: CommonTextWidget(
              text: label!,
              color: labelColor,
              fontSize: labelFontSize,
              fontWeight: labelFontWeight,
            ),
          ),
        Skeletonizer(
          enabled: skeletonLoading,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: cursorColor,
            textDirection: textDirection,
            focusNode: focusNode,
            validator: validator,
            controller: controller,
            style: textStyle?.copyWith(color: textColor),
            readOnly: readOnly,
            enabled: enabled,
            obscureText: password,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            maxLength: maxLength,
            maxLengthEnforcement: MaxLengthEnforcement.none,
            onTap: onTap,
            maxLines: maxLines,
            textAlign:
                locale.languageCode == 'ar' ? TextAlign.right : TextAlign.left,
            onChanged: onChange,
            inputFormatters: [...additionalInputFormatters],
            decoration: onlyBottomBorder
                ? InputDecoration(
                    hintText: hintText?.tr(),
                    hintStyle: TextStyle(color: hintColor),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 19,
                      horizontal: 10,
                    ),
                    filled: true,
                    fillColor: fillColor,
                    prefixIcon: leading,
                    counterText: counterText,
                    suffixIcon: trailing != null
                        ? GestureDetector(
                            onTap: trailingTapped,
                            child: trailing,
                          )
                        : null,
                    border: bottomUnderlineBorder.copyWith(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    errorBorder: bottomUnderlineBorder.copyWith(
                      borderSide: BorderSide(color: errorBorderColor),
                    ),
                    focusedBorder: bottomUnderlineBorder.copyWith(
                      borderSide: BorderSide(color: focusedBorderColor),
                    ),
                    enabledBorder: bottomUnderlineBorder.copyWith(
                      borderSide: BorderSide(color: enabledBorderColor),
                    ),
                  )
                : righSideNoBorder
                    ? InputDecoration(
                        hintText: hintText?.tr(),
                        counterText: counterText,
                        // counterText: '',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 19,
                          horizontal: 10,
                        ),
                        filled: true,
                        fillColor: fillColor,
                        prefixIcon: leading,
                        suffixIcon: trailing != null
                            ? GestureDetector(
                                onTap: trailingTapped,
                                child: trailing,
                              )
                            : null,
                        border: leftCircularBorder.copyWith(
                          borderSide: BorderSide(color: borderColor),
                        ),
                        errorBorder: leftCircularBorder.copyWith(
                          borderSide: BorderSide(color: errorBorderColor),
                        ),
                        focusedBorder: leftCircularBorder.copyWith(
                          borderSide: BorderSide(color: focusedBorderColor),
                        ),
                        enabledBorder: leftCircularBorder.copyWith(
                          borderSide: BorderSide(color: enabledBorderColor),
                        ),
                      )
                    : leftSideNoBorder
                        ? InputDecoration(
                            hintText: hintText?.tr(),
                            counterText: counterText,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 19,
                              horizontal: 10,
                            ),
                            filled: true,
                            fillColor: fillColor,
                            prefixIcon: leading,
                            suffixIcon: trailing != null
                                ? GestureDetector(
                                    onTap: trailingTapped,
                                    child: trailing,
                                  )
                                : null,
                            border: rightCircularBorder.copyWith(
                              borderSide: BorderSide(color: borderColor),
                            ),
                            errorBorder: rightCircularBorder.copyWith(
                              borderSide: BorderSide(color: errorBorderColor),
                            ),
                            focusedBorder: rightCircularBorder.copyWith(
                              borderSide: BorderSide(color: focusedBorderColor),
                            ),
                            enabledBorder: rightCircularBorder.copyWith(
                              borderSide: BorderSide(color: enabledBorderColor),
                            ),
                          )
                        : circularBoder
                            ? InputDecoration(
                                counterText: counterText,

                                hintText: hintText?.tr(),
                                hintStyle: bodyStyle.copyWith(
                                  color: AppColors.kcMediumGray2Color,
                                  fontSize: 14,
                                ),
                                // counterText: '',
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 10,
                                ),
                                filled: true,
                                fillColor: fillColor,
                                prefixIcon: leading,
                                suffixIcon: trailing != null
                                    ? GestureDetector(
                                        onTap: trailingTapped, child: trailing)
                                    : null,
                                border: circularBorder.copyWith(
                                    borderSide: BorderSide(color: borderColor)),
                                errorBorder: circularBorder.copyWith(
                                    borderSide:
                                        BorderSide(color: errorBorderColor)),
                                focusedBorder: circularBorder.copyWith(
                                    borderSide:
                                        BorderSide(color: focusedBorderColor)),
                                enabledBorder: circularBorder.copyWith(
                                    borderSide:
                                        BorderSide(color: enabledBorderColor)),
                              )
                            : InputDecoration(
                                hintText: hintText,
                                counterText: '',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 19, horizontal: 10),
                                filled: true,
                                fillColor: fillColor,
                                prefixIcon: leading,
                                suffixIcon: trailing != null
                                    ? GestureDetector(
                                        onTap: trailingTapped, child: trailing)
                                    : null,
                                border: noBorder.copyWith(
                                    borderSide: BorderSide(color: borderColor)),
                                errorBorder: noBorder.copyWith(
                                    borderSide:
                                        BorderSide(color: errorBorderColor)),
                                focusedBorder: noBorder.copyWith(
                                    borderSide:
                                        BorderSide(color: focusedBorderColor)),
                                enabledBorder: noBorder.copyWith(
                                    borderSide:
                                        BorderSide(color: enabledBorderColor))),
          ),
        ),
      ],
    );
  }
}
