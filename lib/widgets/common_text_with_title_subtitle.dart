import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import 'common_text_widget.dart';

class CommonTextWithTitleSubtitle extends StatelessWidget {
  final String primaryTitle;
  final String primarySubTitle;
  final String secondaryTitle;
  final String secondarySubTitle;

  const CommonTextWithTitleSubtitle({
    super.key,
    required this.primaryTitle,
    required this.primarySubTitle,
    required this.secondaryTitle,
    required this.secondarySubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                CommonTextWidget(
                    text: primaryTitle,
                    color: AppColors.kLightGreyText,
                    fontSize: AppSizes.fSize10,
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,),
                CommonTextWidget(
                    text: primarySubTitle,
                    color: AppColors.kPrimaryColor,
                    fontSize: AppSizes.fSize10,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,),
              ],),),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                CommonTextWidget(
                    text: secondaryTitle,
                    color: AppColors.kLightGreyText,
                    fontSize: AppSizes.fSize10,
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,),
                CommonTextWidget(
                    translate: false,
                    text: secondarySubTitle,
                    color: AppColors.kPrimaryColor,
                    fontSize: AppSizes.fSize10,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,),
              ],),),
        ],),
        AppSizes.height8,
      ],
    );
  }
}
