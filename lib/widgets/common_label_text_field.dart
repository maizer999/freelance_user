import 'package:easy_localization/easy_localization.dart' as localisation;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../constants/app_strings.dart';

class CommonLabelTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String placeholder;
  final bool readOnly;
  final bool isFilled;
  final String? label;
  final Color? labelColor;
  final double? labelFontSize;
  final double? hintFontSize;
  final FontWeight? labelFontWeight;
  final String labelText;
  final Color? hintColor;
  final bool? isMandatory;
  final bool? isPassword;
  final TextStyle? labelStyle;
  final Widget? leading;
  final bool password;
  final bool enabled;
  final bool rightSideNoBorder;
  final bool leftSideNoBorder;
  final bool circularBorder;
  final TextStyle? textStyle;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final int maxLength;
  final int minLines;
  final int maxLines;
  final Color borderColor;
  final Color enabledBorderColor;
  final Color errorBorderColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final double? textFieldHeight;
  final double? textFieldWidth;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
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
  final bool isPasswordIconClicked;

  const CommonLabelTextField({
    super.key,
    this.readOnly = false,
    this.isFilled = false,
    this.controller,
    this.placeholder = '',
    this.leading,
    this.password = false,
    this.trailingTapped,
    this.isPasswordIconClicked = false,
    this.validator,
    this.enabled = true,
    this.rightSideNoBorder = false,
    this.leftSideNoBorder = false,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    required this.labelText,
    this.hintColor = AppColors.kcDarkGray2Color,
    this.maxLength = 250,
    this.textAlign = TextAlign.left,
    this.borderColor = AppColors.kcMediumGray1Color,
    this.enabledBorderColor = AppColors.kcMediumGray1Color,
    this.errorBorderColor = Colors.red,
    this.focusedBorderColor = AppColors.kPrimaryLight,
    this.label,
    this.labelColor,
    this.isMandatory,
    this.labelFontSize,
    this.isPassword,
    this.labelFontWeight,
    this.labelStyle,
    this.textFieldHeight,
    this.textFieldWidth,
    this.onTap,
    this.fillColor = AppColors.kWhite,
    this.circularBorder = true,
    this.minLines = 1,
    this.maxLines = 1,
    this.skeletonLoading = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.onlyBottomBorder = false,
    this.additionalInputFormatters = const [],
    this.onChange,
    this.textColor = AppColors.kPrimaryLight,
    this.focusNode,
    this.cursorColor = AppColors.kPrimaryLight,
    this.hintFontSize,
    this.suffixIcon,
  });

  @override
  State<CommonLabelTextField> createState() => _CommonLabelTextFieldState();
}

class _CommonLabelTextFieldState extends State<CommonLabelTextField> {
  final OutlineInputBorder noBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(0));

  final OutlineInputBorder circularOutlineBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(6));

  final OutlineInputBorder rightCircularBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
  );

  final OutlineInputBorder leftCircularBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
    ),
  );

  final UnderlineInputBorder bottomUnderlineBorder =
      const UnderlineInputBorder();
  late bool isPasswordiconClicked;

  @override
  void initState() {
    isPasswordiconClicked = widget.isPasswordIconClicked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    final textDirection =
        locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;

    return Skeletonizer(
      enabled: widget.skeletonLoading,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: widget.labelText.tr(),
                  style: TextStyle(
                    fontSize: widget.hintFontSize ?? AppSizes.fSize12,
                    color: AppColors.kcOrTextColor,
                    fontFamily: AppStrings.mawaniFontFamily,
                  ),
                  children: [
                    if (widget.isMandatory == true)
                      const TextSpan(
                          text: ' *', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              AppSizes.height10,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: widget.cursorColor ?? AppColors.kcOrTextColor,
                focusNode: widget.focusNode,
                controller: widget.controller,
                textDirection: textDirection,
                style:
                widget.textStyle?.copyWith(color: widget.textColor) ??
                    TextStyle(
                      color: AppColors.kcOrTextColor,
                      fontSize: widget.hintFontSize ?? AppSizes.fSize12,
                      fontFamily: AppStrings.mawaniFontFamily,
                    ),
                readOnly: widget.readOnly,
                enabled: widget.enabled,
                validator: widget.validator,
                obscureText: isPasswordiconClicked,
                keyboardType: widget.keyboardType,
                textCapitalization: widget.textCapitalization,
                maxLength: widget.maxLength,
                textAlign: widget.textAlign,
                onTap: widget.onTap,
                maxLines: widget.maxLines,
                onChanged: widget.onChange,
                inputFormatters: widget.additionalInputFormatters,
                decoration: _buildInputDecoration(context, setState),
              ),
            ],
          );
        },
      ),
    );
  }

  InputDecoration _buildInputDecoration(
    BuildContext context,
    StateSetter setState,
  ) {
    final commonBorder = _determineBorder();
    return InputDecoration(
      // label: RichText(
      //   text: TextSpan(
      //     text: widget.labelText.tr(),
      //     style: TextStyle(
      //       fontSize: widget.hintFontSize ?? AppSizes.fSize12,
      //       color: AppColors.kcOrTextColor,
      //     ),
      //     children: [
      //       if (widget.isMandatory == true)
      //         const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
      //     ],
      //   ),
      // ),
      // labelStyle: TextStyle(
      //   color: widget.labelColor ?? AppColors.kcOrTextColor,
      //   fontSize: widget.labelFontSize ?? AppSizes.fSize12,
      //   fontWeight: widget.labelFontWeight ?? FontWeight.normal,
      // ),
      counterText: '',
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSizes.fSize10,
        horizontal: AppSizes.wSize10,
      ),
      filled: widget.isFilled,
      fillColor: widget.fillColor,
      prefixIcon: Padding(
          padding: EdgeInsets.all(AppSizes.size12),
          child: SizedBox(
            width: AppSizes.fSize20,
            height: AppSizes.fSize20,
            child: widget.leading,
          )),
      suffixIcon: _suffixIconWidget(setState),
      border: commonBorder.copyWith(
        borderSide: BorderSide(color: widget.borderColor),
      ),
      errorBorder: commonBorder.copyWith(
        borderSide: BorderSide(color: widget.errorBorderColor),
      ),
      focusedBorder: commonBorder.copyWith(
        borderSide: BorderSide(color: widget.focusedBorderColor),
      ),
      enabledBorder: commonBorder.copyWith(
        borderSide: BorderSide(color: widget.enabledBorderColor),
      ),
    );
  }

  InputBorder _determineBorder() {
    if (widget.onlyBottomBorder) {
      return bottomUnderlineBorder;
    } else if (widget.rightSideNoBorder) {
      return leftCircularBorder;
    } else if (widget.leftSideNoBorder) {
      return rightCircularBorder;
    } else if (widget.circularBorder) {
      return circularOutlineBorder;
    } else {
      return noBorder;
    }
  }

  Widget? _suffixIconWidget(StateSetter setState) {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    } else if (widget.isPassword == true) {
      return IconButton(
        icon: Icon(
          isPasswordiconClicked
              ? FontAwesomeIcons
                  .eyeSlash // Show "eye-slash" when password is visible
              : FontAwesomeIcons.eye, // Show "eye" when password is hidden
          size: AppSizes.hSize16,
          color: AppColors.kcDarkGrayColor,
        ),
        onPressed: () {
          setState(() {
            isPasswordiconClicked = !isPasswordiconClicked;
          });
        },
      );
    } else {
      return null;
    }
  }
}
