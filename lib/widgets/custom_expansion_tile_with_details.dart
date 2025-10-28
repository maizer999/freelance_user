import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelance_user/widgets/title_subtile_model.dart';
import 'package:velocity_x/velocity_x.dart';
import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../constants/app_sizes.dart';
import '../helper/input_formatter.dart';
import 'common_text_widget.dart';

class CustomExpansionTileWithDetails extends StatefulWidget {
  final String? heading;
  final String? tileheading1;
  final String? tileheading2;
  final String? description;
  final bool initiallyExpanded;
  final bool isListTileReq;
  final int crossAxisCount;
  final int? length;

  /// The number of items to be displayed in the expansion tile.
  /// If not provided, it will default to the length of [titleSubTitles].
  /// If provided, [itemBuilder] must also be provided.
  final List<TitleSubtitleModel> titleSubTitles;
  final Widget? Function(BuildContext context, int index)? itemBuilder;

  /// A function that builds a custom widget for each item in the expansion tile.
  /// If provided, [length] must also be provided.
  /// If not provided, a default widget will be used to display the title and subtitle.
  final List<Widget>? extraWidget;

  CustomExpansionTileWithDetails({
    super.key,
    this.heading,
    this.description,
    required this.titleSubTitles,
    this.crossAxisCount = 2,
    this.initiallyExpanded = false,
    this.itemBuilder,
    this.length,
    this.extraWidget,
    this.isListTileReq = false,
    this.tileheading1,
    this.tileheading2,
  }) {
    assert(
      length != null ? itemBuilder != null : true,
      'If length is not null, itemBuilder must not be null',
    );
  }

  @override
  _CustomExpansionTileWithDetailsState createState() =>
      _CustomExpansionTileWithDetailsState();
}

class _CustomExpansionTileWithDetailsState
    extends State<CustomExpansionTileWithDetails> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: AppSizes.size14),
      child: ExpansionTile(
        initiallyExpanded: widget.initiallyExpanded,
        collapsedBackgroundColor: AppColors.kExpansionTileBg,
        backgroundColor: AppColors.kExpansionTileBg,
        collapsedIconColor: AppColors.kcDarkGrayColor,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius8),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius8),
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        trailing: Image.asset(
          isExpanded ? AppImages.upArrow : AppImages.downArrow,
          width: AppSizes.size24,
          height: AppSizes.size24,
        ),
        title: CommonTextWidget(
          text: (widget.heading ?? '').tr(),
          textAlign: TextAlign.start,
          fontSize: AppSizes.fSize16,
          fontWeight: FontWeight.bold,
          color: AppColors.kcDarkGrayColor,
        ),
        tilePadding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          widget.isListTileReq
              ? Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CommonTextWidget(
                          text: widget.tileheading1.toString(),
                          textAlign: TextAlign.start,
                          color: AppColors.kcDarkGrayColor,
                          fontSize: AppSizes.fSize10,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.visible,
                          height: 1.0,
                        ),
                      ),
                      AppSizes.width8,
                      Expanded(
                        child: CommonTextWidget(
                          text: widget.tileheading2.toString(),
                          textAlign: TextAlign.start,
                          color: AppColors.kcDarkGrayColor,
                          fontSize: AppSizes.fSize10,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.visible,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ).p8(),
                )
              : SizedBox.shrink(),
          Container(
            color: Colors.white,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(20),
              scrollDirection: Axis.vertical,
              itemCount: widget.length ?? widget.titleSubTitles.length,
              itemBuilder: (BuildContext context, int index) {
                if (widget.itemBuilder != null) {
                  return widget.itemBuilder!(context, index);
                } else {
                  final titleSubTitle = widget.titleSubTitles[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CommonTextWidget(
                          text: titleSubTitle.title.tr(),
                          textAlign: TextAlign.start,
                          color: AppColors.kLightGreyText,
                          fontSize: AppSizes.fSize10,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.visible,
                          height: 1.0,
                        ),
                      ),
                      AppSizes.width8,
                      Expanded(
                        child: CommonTextWidget(
                          text: " ${formatNumber(titleSubTitle.subTitle)}",
                          color: AppColors.kPrimaryColor,
                          textAlign: TextAlign.start,
                          fontSize: AppSizes.fSize12,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.visible,
                          height: 1.0,
                          translate: titleSubTitle.translate,
                        ),
                      ),
                    ],
                  ).pOnly(bottom: 20);
                }
              },
            ),
          ),
          if (widget.extraWidget != null)
            Container(
              color: AppColors.kWhite,
              child: Column(
                children: [...widget.extraWidget!],
              ),
            ),
        ],
      ),
    );
  }
}
