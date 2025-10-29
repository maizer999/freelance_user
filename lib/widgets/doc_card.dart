import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../constants/app_images.dart';
import '../theme/ui_helper.dart';
import 'common_text_widget.dart';

class DocDownloadCard extends StatelessWidget {
  final String? documentName;
  final String? documentPath;
  final String? docNameTitle;
  final String? viewIcon;
  final String? vesselName;
  final String? imoNumber;
  final String? vesselType;
  final String? creationDateTime;
  final String? creationDateTimeTitle;
  final String? vesselStatus;
  final String? remarkTitle;
  final String? remarkValue;
  final Color? vesselStatusColor;
  final VoidCallback? onTap;
  final VoidCallback? onTabDocPreview;
  final VoidCallback? onTabDocDownload;

  const DocDownloadCard(
      {super.key,
      this.documentName,
      this.documentPath,
      this.docNameTitle,
      this.remarkTitle,
      this.creationDateTimeTitle,
      this.vesselName,
      this.imoNumber,
      this.vesselType,
      this.remarkValue,
      this.creationDateTime,
      this.vesselStatus,
      this.vesselStatusColor,
      this.viewIcon,
      this.onTap,
      this.onTabDocPreview,
      this.onTabDocDownload});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        boxShadow: getBoxShadow(AppColors.kBorderColor),
        borderRadius: BorderRadius.circular(AppSizes.hSize6),
      ),
      child: Padding(
        padding: AppSizes.padding10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AppImages.documentIcon,
                  height: AppSizes.hSize24,
                ),
                AppSizes.width10,
                Container(
                  height: AppSizes.hSize24,
                  width: 0.5,
                  color: AppColors.statusUnSelectedColor,
                ),
                AppSizes.width10,
                Expanded(
                  flex: 1,
                  child: CommonTextWidget(
                    text: documentName ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    fontSize: AppSizes.size14,
                    color: AppColors.kPrimaryLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppSizes.width10,
                InkWell(
                  onTap: onTabDocPreview,
                  child: SvgPicture.asset(
                    AppImages.previewIcon,
                    height: AppSizes.hSize24,
                  ),
                ),
                AppSizes.width10,
                InkWell(
                  onTap: onTabDocDownload,
                  child: SvgPicture.asset(
                    AppImages.downloadIcon,
                    height: AppSizes.hSize24,
                  ),
                ),
              ],
            ),
            AppSizes.height20,
            Padding(
                padding: EdgeInsetsDirectional.only(start: AppSizes.wSize48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonTextWidget(
                            text: docNameTitle ?? "",
                            color: AppColors.kcDarkGrayColor,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: AppSizes.hSize4),
                          CommonTextWidget(
                            text: documentPath ?? "",
                            fontSize: AppSizes.size14,
                            color: AppColors.kPrimaryLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: AppSizes.wSize8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.hSize14),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.calendar,
                                width: AppSizes.size20,
                                height: AppSizes.size20,
                              ),
                              AppSizes.width6,
                              CommonTextWidget(
                                text: creationDateTime ?? '',
                                fontSize: AppSizes.size14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.kcDarkGrayColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(height: AppSizes.hSize8),
            Padding(
              padding: EdgeInsetsDirectional.only(start: AppSizes.wSize50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                    text: remarkTitle ?? "",
                    color: AppColors.kcDarkGrayColor,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: AppSizes.hSize4),
                  CommonTextWidget(
                    text: remarkValue ?? "sjisji snisninsis",
                    fontSize: AppSizes.size14,
                    color: AppColors.kPrimaryLight,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
