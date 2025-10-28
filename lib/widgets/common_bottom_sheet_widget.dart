import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';
import '../../../constants/app_strings.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../theme/ui_helper.dart';
import 'common_button_widget.dart';
import 'common_text_form_field.dart';
import 'common_text_widget.dart';

class CommonBottomSheetWidget extends StatefulWidget {
  final String? commentTitle;
  final String? commentLabel;
  final String? commentHintText;
  final String? statusMessage;
  final String? crnMessage;
  final String? buttonTitle;
  final bool? isBusy;
  final TextEditingController? controller;
  final VoidCallback? onTabSubmit;
  final int? maxLength;

  const CommonBottomSheetWidget({
    super.key,
    this.commentTitle,
    this.commentLabel,
    this.commentHintText,
    this.buttonTitle,
    this.statusMessage,
    this.crnMessage,
    this.isBusy = false,
    this.onTabSubmit,
    this.controller,
    this.maxLength = 100,
  });

  @override
  State<CommonBottomSheetWidget> createState() =>
      _CommonBottomSheetWidgetState();
}

class _CommonBottomSheetWidgetState extends State<CommonBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: Container(
        padding: EdgeInsets.only(
          top: AppSizes.hSize10,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: getBoxShadow(AppColors.kBorderColor),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSizes.radius20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.hSize20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.radius30),
                    color: AppColors.kPrimaryColor,
                  ),
                  height: AppSizes.hSize4,
                  width: AppSizes.wSize50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommentVariant() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidget(
              text: widget.commentTitle ?? " ",
              fontSize: AppSizes.size16,
              fontWeight: FontWeight.bold,
              color: AppColors.kPrimaryColor,
            ),
            InkWell(
              onTap: () => (widget.isBusy ?? false)
                  ? SizedBox()
                  : Navigator.pop(context),
              child: Icon(
                MdiIcons.close,
                color: AppColors.kPrimaryColor,
                size: AppSizes.fSize18,
              ),
            ),
          ],
        ),
        AppSizes.height50,
        CommonInputFormField(
          label: widget.commentLabel,
          labelColor: AppColors.kcDarkGray2Color,
          labelFontWeight: FontWeight.w700,
          maxLength: widget.maxLength ?? 250,
          additionalInputFormatters: [RemoveEmojiInputFormatter()],
          hintText: widget.commentHintText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.requiredField;
            }
            return null;
          },
          controller: widget.controller,
          maxLines: 3,
          enabled: !(widget.isBusy ?? false),
        ),
        AppSizes.height50,
        CommonButtonWidget(
          text: widget.buttonTitle,
          fontSize: AppSizes.fSize14,
          backgroundColor: AppColors.kPrimaryColor,
          borderRadius: AppSizes.radius6,
          height: AppSizes.hSize40,
          onTap: widget.isBusy ?? false ? null : widget.onTabSubmit,
          isLoading: widget.isBusy ?? false,
        ),
        AppSizes.height20,
      ],
    );
  }

}
