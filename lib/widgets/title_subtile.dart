import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_sizes.dart';
import 'common_text_widget.dart';

class TitleSubtitleRowTextWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Icon? icon;
  final bool translate;

  const TitleSubtitleRowTextWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      this.icon,
      this.translate = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: CommonTextWidget(
            text: "${title.tr()} : ",
            textAlign: TextAlign.start,
            color: AppColors.kLightGreyText,
            fontSize: AppSizes.fSize10,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.visible,
            height: 1.0,
          ),
        ),
        Expanded(
          flex: 7,
          child: Row(
            children: [
              Expanded(
                child: CommonTextWidget(
                  text: " $subTitle",
                  color: AppColors.kPrimaryColor,
                  textAlign: TextAlign.start,
                  fontSize: AppSizes.fSize12,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  height: 1.0,
                  translate: translate,
                ),
              ),
              AppSizes.width4,
              if (icon != null) icon! else SizedBox(),
            ],
          ),
        ),
      ],
    ).pOnly(bottom: 16);
  }
}
