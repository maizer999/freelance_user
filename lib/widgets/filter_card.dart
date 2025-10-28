import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';

class FilterCard<T> extends StatelessWidget {
  final T filter;
  final bool isSelected;
  final Color? leftBorderColor;

  const FilterCard({
    super.key,
    required this.filter,
    required this.isSelected,
    required this.leftBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius12),
        ),
        color: isSelected
            ? AppColors.kPrimaryColor
            : AppColors.statusUnSelectedColor,
        child: Padding(
          padding: EdgeInsets.all(AppSizes.size6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.radius14),
                ),
              ),
              Padding(
                padding: AppSizes.symmetricPadding6,
                child: Center(
                  child: Text(
                    filter.toString().tr(),
                    style: TextStyle(
                        fontSize: AppSizes.size15.sp,
                        fontFamily: AppStrings.mawaniFontFamily,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? AppColors.kWhite
                            : AppColors.kPrimaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
