import 'package:flutter/cupertino.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import 'common_text_widget.dart';

class CommonRowTitleSubtitle extends StatelessWidget {
  final String label;
  final String value;

  const CommonRowTitleSubtitle({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CommonTextWidget(
                text: label,
                color: AppColors.kLightGreyText,
                fontSize: AppSizes.fSize10,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: CommonTextWidget(
                text: value,
                color: AppColors.kPrimaryColor,
                fontSize: AppSizes.fSize12,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppSizes.hSize10,
        ),
      ],
    );
  }
}
