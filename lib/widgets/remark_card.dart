import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import 'common_text_widget.dart';
import 'custom_container.dart';

class CardContent extends StatelessWidget {
  final String header;
  final String body;

  const CardContent({
    super.key,
    required this.header,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          text: header,
          fontSize: AppSizes.size10,
          color: AppColors.kcDarkGrayColor,
        ),
        CommonTextWidget(
          text: body,
          fontSize: AppSizes.size12,
          fontWeight: FontWeight.bold,
          color: AppColors.kPrimaryColor,
        ),
      ],
    );
  }
}

class CardContentDetails extends StatelessWidget {
  final String heading;
  final String header1;
  final String body1;
  final String header2;
  final String body2;

  const CardContentDetails({
    super.key,
    required this.heading,
    required this.header1,
    required this.body1,
    required this.header2,
    required this.body2,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextWidget(
            text: heading,
            fontSize: AppSizes.size10,
            color: AppColors.kcDarkGrayColor,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(child: CardContent(header: header1, body: body1)),
              Expanded(child: CardContent(header: header2, body: body2)),
            ],
          ),
        ],
      ),
    ).p8();
  }
}