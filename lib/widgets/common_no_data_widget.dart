import 'package:flutter/widgets.dart';
import '../../../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';
import 'common_text_widget.dart';

class CommonNoDataWidget extends StatelessWidget {
  final bool isListData;

  const CommonNoDataWidget({
    super.key,
    this.isListData = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isListData) {
      return Center(
        child: CommonTextWidget(
          text: AppStrings.noDataFound,
          color: AppColors.kcMediumGray2Color,
          fontSize: AppSizes.fSize16,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.noData,
              width: 100,
              height: 100,
            ),
            CommonTextWidget(
              text: AppStrings.noDataFound,
              color: AppColors.kcMediumGray2Color,
              fontSize: AppSizes.fSize16,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }
  }
}
