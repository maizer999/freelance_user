import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../constants/app_sizes.dart';
import '../helper/language/language_utils.dart';
import 'package:velocity_x/velocity_x.dart';

import 'common_app_bar.dart';

class CommonBackground extends StatelessWidget {
  final CommonAppBar appBar;
  final Widget body;

  const CommonBackground({super.key, required this.appBar, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBackground,
        appBar: appBar,


        body: Container(
                padding: EdgeInsets.symmetric(vertical: AppSizes.size10),
                color: AppColors.kBackground,
                child: body)
            .safeArea());
  }
}
