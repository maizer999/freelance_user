import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import 'common_text_widget.dart';

class CommonDialog {
  final Widget contentWidget;
  final String? positiveDialogBtnText;
  final String? negativeRedDialogBtnText;
  final String? title;
  final bool isCloseButtonRequired;
  final VoidCallback? onNegativeRedBtnClicked;
  final VoidCallback? onPositiveButtonClicked;

  CommonDialog({
    required BuildContext context,
    required this.contentWidget,
    this.positiveDialogBtnText,
    this.title,
    this.negativeRedDialogBtnText,
    this.isCloseButtonRequired = true,
    this.onPositiveButtonClicked,
    this.onNegativeRedBtnClicked,
  }) {
    _showDialog(context);
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: AppColors.kWhite,
            surfaceTintColor: AppColors.kWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.hSize8)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.wSize10),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if(title?.isNotEmpty == true)
                    CommonTextWidget(
                      text: title ?? '',
                      fontSize: AppSizes.fSize16,
                      fontWeight: FontWeight.w600,
                    ),
                      AppSizes.height20,
                    if (isCloseButtonRequired)
                      IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.circleXmark,
                          color: AppColors.kDarkRed,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                  ],
                ),
                contentWidget,
                if (positiveDialogBtnText != null ||
                    negativeRedDialogBtnText != null)
                  AppSizes.height20,
              ],
            ),
            actions: <Widget>[
              if (positiveDialogBtnText != null)
                OutlinedButton(
                  onPressed: () {
                    if (onPositiveButtonClicked != null) {
                      Navigator.of(context).pop();
                      onPositiveButtonClicked!();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(positiveDialogBtnText!),
                ),
              if (negativeRedDialogBtnText != null)
                OutlinedButton(
                  onPressed: () {
                    if (onNegativeRedBtnClicked != null) {
                      Navigator.of(context).pop();
                      onNegativeRedBtnClicked!();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    negativeRedDialogBtnText!,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
