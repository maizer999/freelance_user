import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import 'common_text_widget.dart';

class DocTextWidget extends StatelessWidget {
  final String docURL;

  const DocTextWidget({super.key, required this.docURL});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CommonTextWidget(
          text: docURL,
          fontSize: AppSizes.size16,
          fontWeight: FontWeight.bold,
          color: AppColors.kPrimaryColor,),
    ],);
  }
}
