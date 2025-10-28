import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_sizes.dart';

import '../../../constants/app_strings.dart';
import 'common_text_widget.dart';

class MoreDetailsCard extends StatelessWidget {
  final List<Map<String, String>> titleSubtitlePairs;
  final bool isNextReq;
  final GestureTapCallback? onTapNext;

  const MoreDetailsCard({
    super.key,
    required this.titleSubtitlePairs,
    this.isNextReq = false,
    this.onTapNext,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapNext,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var pair in titleSubtitlePairs) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CommonTextWidget(
                            text: pair[AppStrings.title]!,
                            color: AppColors.kLightGreyText,
                            fontSize: AppSizes.fSize10,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          child: CommonTextWidget(
                            text: pair[AppStrings.subTitle]!,
                            color: AppColors.kPrimaryColor,
                            textAlign: TextAlign.start,
                            fontSize: AppSizes.fSize12,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.visible,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ).pOnly(top: 4),
                  ],
                ],
              ),
            ),
            isNextReq
                ? Expanded(
                    flex: 0,
                    child: Icon(
                      Icons.chevron_right,
                      size: 24,
                      color: AppColors.kPrimaryColor,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
