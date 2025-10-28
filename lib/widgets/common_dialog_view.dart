import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_strings.dart';
import 'common_text_widget.dart';
import 'custom_popscope.dart';

@RoutePage()
class CommonResponseDialogView extends StatelessWidget {
  final String? responseMessage;
  final String? statusCode;
  final String? buttonText;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final String? routePage;
  final bool isLoading;
  final String? loadingMessage;

  const CommonResponseDialogView({
    super.key,
    this.responseMessage,
    this.statusCode,
    this.buttonText,
    this.onTap,
    this.width,
    this.height,
    this.routePage,
    this.loadingMessage,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MyPopScope(
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        content: isLoading
            ? Center(
            child: Column(
              children: [
                CommonTextWidget(
                  text: loadingMessage ?? "",
                  fontSize: 20,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CircularProgressIndicator(),
              ],
            ))
            : Text(responseMessage?.tr() ?? '').tr(),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (routePage != null) {
                context.router.navigatePath(routePage!);
              }
              if (onTap != null) {
                onTap!();
              } else {
                context.maybePop();
              }
            },
            child:Text(buttonText?.tr() ?? AppStrings.ok.tr()).tr(),
          ),
        ],
      ),
    );
  }
}