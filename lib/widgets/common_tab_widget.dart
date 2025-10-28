import 'package:flutter/material.dart';

import '../../../constants/app_sizes.dart';
import 'common_text_widget.dart';

class CommonTabWidget extends StatelessWidget {
  final String label;
  final String? imgPath;

  const CommonTabWidget({super.key, required this.label, this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imgPath != null)
            Image.asset(
              imgPath ?? "",
            ),
          if (imgPath != null)
            SizedBox(
              width: AppSizes.size4,
            ),
          CommonTextWidget(
            text: label,
            fontSize: AppSizes.fSize14,
          ),
        ],
      ),
    );
  }
}
