import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../providers/access_control_logic.dart';
import '../providers/rollbase_string_constant.dart';
import 'flip_icon.dart';

class CommonButtonWidget extends ConsumerWidget {
  final double? width;
  double? height;
  final VoidCallback? onTap;
  String? text;
  double? fontSize;
  double? borderRadius;
  Color? backgroundColor;
  Color? borderColor;
  final double? borderWidth;
  FontWeight? fontWeight;
  Color? color;
  final EdgeInsets? padding;
  String? accessCheckText;
  final String pageURl;
  final bool isLoading; // Add isLoading parameter
  final String? icon;
  final bool enabled;
  final bool rightIcon;
  final ButtonType? buttonType;

  CommonButtonWidget(
      {super.key,
      this.width,
      this.height,
      required this.onTap,
      this.backgroundColor,
      this.borderColor,
      this.borderWidth,
      this.color,
      this.text,
      this.borderRadius,
      this.fontSize,
      this.fontWeight,
      this.padding,
      this.pageURl = "",
      this.accessCheckText = "",
      this.isLoading = false, // Default isLoading to false
      this.icon,
      this.enabled = true,
      this.rightIcon = false,
      this.buttonType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    checkButtonType();
    final buttonHaveAccess = ref.watch(
      accessControlProvider(
        (
          pageUrl: pageURl,
          permissionType: accessCheckText ?? "",
        ),
      ),
    );
    if (kDebugMode) {
      print("Button have access $buttonHaveAccess");
    }
    return buttonHaveAccess ? _buildButton(context) : const SizedBox();
  }

  Widget _buildButton(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: width,
        height: height ?? AppSizes.hSize30,
      ),
      child: Container(
        width: width,
        height: height ?? AppSizes.hSize30,
        decoration: BoxDecoration(
          border: Border.all(
            color: enabled
                ? borderColor ?? AppColors.kFentSkyBlue
                : AppColors.kSecondaryLight,
            width: borderWidth ?? 1.0,
          ),
          color: enabled
              ? backgroundColor ?? AppColors.kPrimaryColor
              : AppColors.kSecondaryLight,
          borderRadius: BorderRadius.circular(borderRadius ?? AppSizes.fSize4),
        ),
        child: InkWell(
          onTap: isLoading || enabled == false ? null : onTap,
          child: Padding(
            padding: padding ?? EdgeInsets.all(AppSizes.size8),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: AppSizes.wSize24,
                      height: AppSizes.wSize24,
                      child: FittedBox(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: backgroundColor == AppColors.kPrimaryColor
                              ? AppColors.kWhite
                              : AppColors.kPrimaryColor,
                        ),
                      ),
                    )
                  : (icon == null)
                      ? Text(
                          text ?? '',
                          softWrap: true,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: color ?? Colors.white,
                            fontSize: fontSize ?? 14.0.sp,
                            fontWeight: fontWeight ?? FontWeight.w400,
                            fontFamily: AppStrings.fontFamily,
                          ),
                        ).tr()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!rightIcon)
                              Image.asset(
                                color: color,
                                icon ?? "",
                                height: AppSizes.hSize30,
                              ),
                            if (!rightIcon) AppSizes.width10,
                            Text(
                              text ?? '',
                              softWrap: true,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: color ?? Colors.white,
                                fontSize: fontSize ?? 14.0.sp,
                                fontFamily: AppStrings.fontFamily,
                              ),
                            ).tr(),
                            if (rightIcon) AppSizes.width10,
                            if (rightIcon)
                              flipIcon(context, icon ?? "", AppSizes.hSize30)
                          ],
                        ),
            ),
          ),
        ),
      ),
    );
  }

  void checkButtonType() {
    if (buttonType != null) {
      height = AppSizes.size50;
      fontWeight = FontWeight.w600;
      borderRadius = AppSizes.radius8;
      fontSize = AppSizes.fSize16;
      switch (buttonType) {
        case ButtonType.approve:
          accessCheckText = RollBaseStringConstant.approveRejectAccess;
          backgroundColor = AppColors.kPrimaryColor;
          text ??= AppStrings.approve;
        case ButtonType.reject:
          accessCheckText = RollBaseStringConstant.approveRejectAccess;
          backgroundColor = AppColors.kTransparent;
          borderColor = AppColors.kTransparent;
          text ??= AppStrings.reject;
          color = AppColors.kRed;
        case ButtonType.submit:
          accessCheckText = RollBaseStringConstant.createAccess;
          backgroundColor = AppColors.kPrimaryColor;
          text ??= AppStrings.submit;
        case ButtonType.cancel:
          backgroundColor = AppColors.kTransparent;
          borderColor = AppColors.kTransparent;
          text ??= AppStrings.cancel;
          color = AppColors.kRed;
        case ButtonType.outline:
          accessCheckText = RollBaseStringConstant.approveRejectAccess;
          backgroundColor = AppColors.kTransparent;
          borderColor = AppColors.kBorderColor;
          color = AppColors.kcDarkGray2Color;
        case ButtonType.login:
          backgroundColor = AppColors.kPrimaryColor;
        default:
      }
    }
  }
}

enum ButtonType { approve, reject, submit, cancel, outline, login }
