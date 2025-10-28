import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../constants/app_sizes.dart';
import '../helper/language/language_utils.dart';
import 'common_text_widget.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? appBarTitle;
  final String? leadingIcon;
  final List<Widget>? actions;

  const CommonAppBar({
    super.key,
    this.appBarTitle,
    this.leadingIcon,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.headerBackground),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: AppSizes.size20,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.kBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.size22),
                topRight: Radius.circular(AppSizes.size22),
              ),
            ),
          ),
          // )
        ),
        AppBar(
          backgroundColor: AppColors.kTransparent,
          leading: ConstrainedBox(
              constraints: BoxConstraints(minWidth: AppSizes.size56),
              child: Container(
                  margin: isEnglish(context)
                      ? EdgeInsets.only(left: AppSizes.size16)
                      : EdgeInsets.only(right: AppSizes.size16),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: leadingIcon == null
                        ? () {
                            context.pop();
                          }
                        : null,
                    child: Image.asset(
                      leadingIcon ??
                          (isEnglish(context)
                              ? AppImages.back
                              : AppImages.backAr),
                    ),
                  ))),
          title: CommonTextWidget(
            text: appBarTitle?.tr() ?? '',
            color: AppColors.kWhite,
            fontSize: AppSizes.size18,
          ),
          centerTitle: false,
          actions: [
            ...?actions,
            AppSizes.width6
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.hSize80);
}

