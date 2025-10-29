import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../constants/app_images.dart';
import '../constants/app_strings.dart';
import '../helper/input_formatter.dart';
import '../providers/access_control_logic.dart';
import 'common_text_widget.dart';

class CommonCard extends ConsumerStatefulWidget {
  final String? refNo;
  final String? vesselName;
  final String? header1;
  final String? body1;
  final String? header2;
  final String? body2;
  final String? dateTitle;
  final String? dateValue;
  final String? status;
  final Color? statusColor;
  final VoidCallback? onTapNext;
  final VoidCallback? onViewClick;
  final VoidCallback? onEditClick;
  final bool displaySubInfo2;
  final bool isStatusCardRequired;
  final bool? isEditRequired;
  final bool? isViewRequired;
  final String accessViewCheckText;
  final String accessEditCheckText;
  final String pageURl;

  const CommonCard({
    super.key,
    this.refNo,
    this.vesselName,
    this.header1,
    this.body1,
    this.header2,
    this.body2,
    this.dateTitle,
    this.dateValue,
    this.status,
    this.statusColor,
    this.onTapNext,
    this.onViewClick,
    this.onEditClick,
    this.isViewRequired,
    this.isEditRequired,
    this.displaySubInfo2 = false,
    this.isStatusCardRequired = true,
    this.pageURl = "",
    this.accessViewCheckText = "",
    this.accessEditCheckText = "",
  });

  @override
  ConsumerState<CommonCard> createState() => _CommonCardState();
}

class _CommonCardState extends ConsumerState<CommonCard> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.isStatusCardRequired ? widget.onTapNext : null,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalMargin - 4,
            vertical: AppSizes.size6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radius8),
          border: Border.all(color: AppColors.kcLightGrayColor),
          color: AppColors.kWhite,
        ),
        child: Padding(
          padding: AppSizes.padding16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppImages.shipIcon,
                    width: AppSizes.size30,
                  ),
                  AppSizes.width10,
                  Container(
                    color: AppColors.statusUnSelectedColor,
                    margin: EdgeInsets.symmetric(vertical: AppSizes.size2),
                    height: AppSizes.size33,
                    width: 1,
                  )
                ],
              ),
              AppSizes.width10,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                    text: widget.refNo ?? AppStrings.submit,
                    fontSize: AppSizes.fSize16,
                    color: AppColors.kcDarkGrayColor,
                  ),
                  docNameWidget(width/3.5),
                  AppSizes.height20,
                  _commonTextForImo(
                      title: widget.header1 ?? ' ',
                      subTitle: "#${formatNumber(widget.body1)}" ?? ' ',
                      color: AppColors.kPrimaryColor),
                  AppSizes.height4,

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.calendar,
                        width: AppSizes.size20,
                        height: AppSizes.size20,
                      ),
                      AppSizes.width4,
                      CommonTextWidget(
                        text: widget.dateValue ?? "",
                        color: AppColors.kcDarkGrayColor,
                      ),
                    ],
                  ),
                ],
              ),
Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  widget.isStatusCardRequired
                      ? _buildStatusBadge()
                      : _buildOptionalIcons(),
                  AppSizes.height20,
                  _commonText(
                      title: widget.header2 ?? ' ',
                      subTitle: widget.body2 ?? ' ',
                      color: AppColors.kcDarkGrayColor),
                ],
              ),
             ],
          ),
        ),
      ),
    );
  }

  Widget docNameWidget(double width) {
    return Container(
      width: width, // or use double.infinity to take full available space
      child: CommonTextWidget(
        text: widget.vesselName ?? '',
        fontSize: AppSizes.size14,
        fontWeight: FontWeight.bold,
        color: AppColors.kcDarkGrayColor,
        maxLines: 2, // optional: limit to 2 lines
        overflow: TextOverflow.ellipsis, // optional: show '...' if too long
      ),
    );
  }


  Widget _buildStatusBadge() {
    return Container(
      // height: AppSizes.size30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        color: widget.statusColor?.withValues(alpha: .15) ?? AppColors.kWhite,
        // boxShadow: getBoxShadow(AppColors.kBorderColor),
      ),
      child: Padding(
        padding: AppSizes.padding8,
        child: Center(
          child: Row(
            children: [
              Container(
                width: AppSizes.size12,
                height: AppSizes.size12,
                decoration: BoxDecoration(
                  color: widget.statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: AppSizes.size4,
              ),
              ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 80),
                  child: Text(
                    widget.status?.tr() ?? '',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: AppStrings.mawaniFontFamily,
                      fontWeight: FontWeight.w500,
                      color: widget.statusColor,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionalIcons() {
    return Row(
      children: [
        widget.isViewRequired == true
            ? _buildIconButton(
                widget.onViewClick,
                AppImages.eye,
                widget.accessViewCheckText,
              )
            : SizedBox(),
        widget.isEditRequired == true ? AppSizes.width10 : SizedBox(),
        widget.isEditRequired == true
            ? _buildIconButton(
                widget.onEditClick,
                AppImages.edit,
                widget.accessEditCheckText,
              )
            : SizedBox(),
      ],
    );
  }

  Widget _buildIconButton(
    VoidCallback? onPressed,
    // IconData icon,
    String imgPath,
    String accessCheckText,
  ) {
    // Check access permissions
    final hasAccess = ref.watch(
      accessControlProvider(
        (
          pageUrl: widget.pageURl,
          permissionType: accessCheckText,
        ),
      ),
    );
    // If there is access, return the InkWell; otherwise, return SizedBox
    if (widget.pageURl.isNotEmpty && hasAccess) {
      return InkWell(
        onTap: onPressed,
        child: Image.asset(
          imgPath,
          width: AppSizes.size22,
          height: AppSizes.size22,
        ),
      );
    } else {
      return SizedBox(); // Return an empty box if no access
    }
  }
}

Widget _commonText(
    {required String title, required String subTitle, required Color color}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CommonTextWidget(
        text: title,
        fontSize: AppSizes.size10,
        color: color,
      ),
      CommonTextWidget(
        text: subTitle,
        fontSize: AppSizes.size12,
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryColor,
      ),
    ],
  );
}

Widget _commonTextForImo(
    {required String title, required String subTitle, required Color color}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CommonTextWidget(
        text: title,
        fontSize: AppSizes.fSize8,
        color: color,
      ),
      AppSizes.width2,
      CommonTextWidget(
        text: subTitle,
        fontSize: AppSizes.fSize14,
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryColor,
      ),
    ],
  );
}
