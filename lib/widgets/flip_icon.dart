import 'package:flutter/cupertino.dart';

import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';

Widget flipIcon(BuildContext context, String imagePath, double? height) {
  return height == null ? Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(
          Directionality.of(context) == TextDirection.rtl ? 3.1416 : 0,
        ),
        child: Image.asset(
          imagePath,
          width: AppSizes.fSize28,
          height: AppSizes.hSize70,
        )) : Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(
          Directionality.of(context) == TextDirection.rtl ? 3.1416 : 0,
        ),
        child: Image.asset(
          imagePath,
          width: AppSizes.fSize28,
          height: height,
        ));
}
