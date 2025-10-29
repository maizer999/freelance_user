import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_images.dart';
import '../constants/app_strings.dart';
import 'common_text_widget.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_sizes.dart';
import 'download_dialog_view.dart';

class CommonDownloadWidget extends ConsumerWidget {
  final String? filePath;
  final String fileName;
  final int? downloadKey;
  final String? title;
  final Function()? onDownloadComplete;
  final bool? isVertical;

  CommonDownloadWidget({
    super.key,
    required this.filePath,
    required this.fileName,
    required this.downloadKey,
    this.title,
    this.onDownloadComplete,
    this.isVertical = false,
  });

  void _handleDownload(BuildContext context, WidgetRef ref) {
    final params = {
      "fileName": fileName,
      "key": downloadKey ?? 0,
      "filePath": filePath ?? '',
    };

    openDownloadDialog(
      context,
      params,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => _handleDownload(context, ref),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.size6),
        child: title != null
            ? (isVertical == true
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title!.isNotEmpty)
              CommonTextWidget(
                color: AppColors.kLightGreyText,
                fontSize: AppSizes.fSize10,
                fontWeight: FontWeight.w400,
                text: "${title!.tr()} : ",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                height: AppSizes.size1,
              ),
            Row(
              children: [
                Flexible(
                  child: CommonTextWidget(
                    text: fileName,
                    textAlign: TextAlign.start,
                    color: AppColors.kPrimaryColor,
                    fontSize: AppSizes.fSize12,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    height: AppSizes.size1,
                  ),
                ),
                SizedBox(width: 4),
                SvgPicture.asset(
                  AppImages.downloadIcon,
                  height: AppSizes.size18,
                ),
              ],
            ),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (title!.isNotEmpty)
              Flexible(
                flex: 4,
                child: CommonTextWidget(
                  color: AppColors.kLightGreyText,
                  fontSize: AppSizes.fSize10,
                  fontWeight: FontWeight.w400,
                  text: "${title!.tr()} : ",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  height: AppSizes.size1,
                ),
              ),
            SizedBox(width: 8),
            Flexible(
              flex: 6,
              child: Row(
                children: [
                  Flexible(
                    child: CommonTextWidget(
                      text: fileName,
                      textAlign: TextAlign.start,
                      color: AppColors.kPrimaryColor,
                      fontSize: AppSizes.fSize12,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      height: AppSizes.size1,
                    ),
                  ),
                  SizedBox(width: 4),
                  SvgPicture.asset(
                    AppImages.downloadIcon,
                    height: AppSizes.size18,
                  ),
                ],
              ),
            ),
          ],
        ))
            : Container(
          width: double.infinity,
          height: AppSizes.size50,
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: CommonTextWidget(
              text: AppStrings.downloadFile,
              color: Colors.white,
              fontSize: AppSizes.fSize14,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              height: AppSizes.size1,
            ),
          ),
        ),
      ),
    );
  }
}
