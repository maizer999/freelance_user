import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;

  const CustomContainer({
    super.key,
    required this.child, Color? backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radius4),
        border: Border.all(color: AppColors.kcLightGrayColor),
        color: AppColors.kWhite,
      ),
      child: Padding(padding: AppSizes.symmetricPadding8, child: child),
    );
  }
}
