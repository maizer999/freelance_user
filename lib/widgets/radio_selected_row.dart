import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import 'custom_container.dart';
import 'common_text_widget.dart';

class RadioSelectedRow extends StatelessWidget {
  final String? headline1;
  final String? body1;
  final String? headline2;
  final String? body2;
  final bool isSelected;
  final VoidCallback onSelected;

  const RadioSelectedRow({
    super.key,
    this.headline1,
    this.body1,
    this.headline2,
    this.body2,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: CustomContainer(
        backgroundColor: isSelected ? AppColors.kPrimaryColor : null,
        child: Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: isSelected,
              onChanged: (_) => onSelected(),
              activeColor: AppColors.kPrimaryColor,
            ),
            Expanded(
              flex: 1,
              child: SizedBox()
            ),
            Expanded(
              flex: 3,
              child: _dataBox(
                label: headline1 ?? '',
                value: body1 ?? '-',
              ),
            ),
            Expanded(
              flex: 5,
              child: _dataBox(
                label: headline2 ?? '',
                value: body2 ?? '-',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dataBox({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          text: label,
          color: AppColors.kLightGreyText,
          fontSize: AppSizes.fSize10,
          fontWeight: FontWeight.w400,
        ),
        AppSizes.height6,
        CommonTextWidget(
          text: value,
          color: AppColors.kPrimaryColor,
          fontSize: AppSizes.fSize12,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
