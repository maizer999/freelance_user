import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import 'common_text_widget.dart';

class CommonTitleSubTitleText extends StatelessWidget {
  final String primaryTitle;
  final String primarySubTitle;
  final bool translate;

  CommonTitleSubTitleText(
      {super.key,
      required this.primaryTitle,
      required this.primarySubTitle,
      this.translate = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          text: primaryTitle,
          fontSize: AppSizes.size10,
          color: AppColors.kcDarkGrayColor,
        ),
        CommonTextWidget(
          text: primarySubTitle,
          fontSize: AppSizes.size12,
          fontWeight: FontWeight.bold,
          color: AppColors.kPrimaryColor,
          translate: translate,
        ),
      ],
    );
  }
}
