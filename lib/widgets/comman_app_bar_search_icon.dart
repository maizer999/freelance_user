import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../providers/providers.dart';

class CommonAppBarSearchIcon extends ConsumerStatefulWidget {
  const CommonAppBarSearchIcon({super.key});

  @override
  ConsumerState createState() => _CommanAppBarSearchIconState();
}

class _CommanAppBarSearchIconState
    extends ConsumerState<CommonAppBarSearchIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ref.read(isSearchEnabled.notifier).update(
              (state) => !state,
            );
      },
      child: SvgPicture.asset(
        AppImages.mSearchIcon,
        height: AppSizes.hSize22,
        colorFilter: const ColorFilter.mode(AppColors.kWhite, BlendMode.srcIn),
      ),
    );
  }
}
