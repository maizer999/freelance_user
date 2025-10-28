import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../theme/ui_helper.dart';
import 'common_text_widget.dart';

class StatusIndicatorWidget extends StatelessWidget {
  final String statusName;
  final String? vesselName;
  final void Function()? onTapStatus;

  const StatusIndicatorWidget(
      {super.key, required this.statusName, this.onTapStatus, this.vesselName,});

  @override
  Widget build(BuildContext context) {
    Color statusColor = AppColors.kFentSkyBlue; // getStatusColor(statusName);

    return InkWell(
      onTap: onTapStatus,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CommonTextWidget(
              text: vesselName ?? '-',
              fontSize: AppSizes.size22,
              fontWeight: FontWeight.w600,
              color: AppColors.kPrimaryColor,
              overflow: TextOverflow.ellipsis,
              // Handle overflow
              maxLines: 2, // Allow up to 2 lines
            ),
          ),
          AppSizes.width26,
          Container(
            height: AppSizes.size33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.sp),
              color: statusColor.withOpacity(.2),
              boxShadow: getBoxShadow(AppColors.kBorderColor),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.size12,vertical: AppSizes.size6),
              child: Center(
                child: Row(
                  children: [
                  Container(
                  width: AppSizes.size10,
                  height: AppSizes.size10,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: AppSizes.size4,
                ),CommonTextWidget(
                  text: statusName,
                  fontSize: AppSizes.fSize12,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                )]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
