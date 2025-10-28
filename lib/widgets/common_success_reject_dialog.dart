import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../constants/app_strings.dart';
import '../routes/auto_router_provider.dart';
import 'common_dialog.dart';
import 'common_button_widget.dart';
import 'common_text_widget.dart';

class SuccessRejectDialog {
  void approveDialog({
    required String? message,
    required String routePage,
    String? buttonText2,
    VoidCallback? onTabButton1,
    VoidCallback? onTabButton2,
    bool isDownloadRequired = false,
    bool isLoading = false,
    BuildContext? context ,
  }) {
    try {
      CommonDialog(
        isCloseButtonRequired: false,
        context: navigatorKey.currentState!.overlay!.context,
        contentWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.circleCheck,
                size: AppSizes.hSize50,
                color: AppColors.kPrimaryGreenColor,
              ),
              AppSizes.height10,
              CommonTextWidget(
                text: message ?? '',
                fontSize: AppSizes.hSize14,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              AppSizes.height10,
              Row(
                children: [
                  Expanded(
                    child: CommonButtonWidget(
                      height: AppSizes.hSize40,
                      text: AppStrings.ok,
                      onTap: () {
                        onTabButton1?.call();
                        navigatorKey.currentState!.overlay!.context
                            .navigateToPath(routePage);
                      },
                    ),
                  ),
                  if (isDownloadRequired) ...[
                    AppSizes.width10, // Add spacing between buttons
                    Expanded(
                      child: CommonButtonWidget(
                        height: AppSizes.hSize40,
                        text: buttonText2,
                        isLoading: isLoading,
                        onTap: () => onTabButton2!(),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      //
    }
  }

  void rejectDialog({
    required String? message,
    required String routePage,
    void Function()? onTap,
    void Function()? onDownloadTap,
  }) {
    CommonDialog(
      isCloseButtonRequired: false,
      context: navigatorKey.currentState!.overlay!.context,
      contentWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.circleXmark,
            size: AppSizes.hSize50,
            color: AppColors.kDarkRed,
          ),
          AppSizes.height10,
          Center(
            child: CommonTextWidget(
              textAlign: TextAlign.center,
              text: message ?? '   ',
              translate: true,
              fontSize: AppSizes.hSize14,
            ),
          ),
          AppSizes.height10,
          CommonButtonWidget(
            height: AppSizes.hSize40,
            text: AppStrings.ok,
            onTap: () {
              var currentState = navigatorKey.currentState;
              if (currentState != null) {
                AutoRouter.of(currentState.context).navigatePath(routePage);
                if (onTap != null) {
                  onTap.call();
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

void showCommonStatusDialog(
    BuildContext context, bool isSuccess, String message,
    {Function()? onCallBack, Function()? onDownloadCallBack}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    CommonDialog(
      isCloseButtonRequired: false,
      context: context,
      contentWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isSuccess
              ? Icon(
                  FontAwesomeIcons.circleCheck,
                  size: AppSizes.hSize50,
                  color: AppColors.kPrimaryGreenColor,
                )
              : Icon(
                  FontAwesomeIcons.circleXmark,
                  size: AppSizes.hSize50,
                  color: AppColors.kDarkRed,
                ),
          AppSizes.height20,
          Center(
            child: CommonTextWidget(
              textAlign: TextAlign.center,
              text: message,
              translate: true,
              fontSize: AppSizes.hSize14,
            ),
          ),
          AppSizes.height20,
          Row(
            children: [
              Expanded(
                child: CommonButtonWidget(
                  height: AppSizes.hSize40,
                  text: AppStrings.ok,
                  onTap: () {
                    Navigator.pop(context);
                    if (onCallBack != null) {
                      onCallBack();
                    }
                  },
                ),
              ),
              if (onDownloadCallBack != null) ...[
                AppSizes.width10, // Add spacing between buttons
                Expanded(
                  child: CommonButtonWidget(
                    height: AppSizes.hSize40,
                    text: AppStrings.download,
                    onTap: () => onDownloadCallBack(),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  });
}
