import 'package:flutter/material.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_sizes.dart';
import '../constants/app_images.dart';
import 'common_text_widget.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget? textWidget;
  final String? title;
  final List<Widget>? children;
  final bool initiallyExpanded;
  final String? heading;
  final String? description;
  final int? itemCount;
  final double? spacing;
  final bool noPadding;
  final Color childrenBackground;

  const CustomExpansionTile(
      {super.key,
      this.textWidget,
      this.title,
      this.heading,
      this.description,
      this.children,
      this.itemCount,
      this.initiallyExpanded = false,
      this.spacing,
      this.noPadding = false,
      this.childrenBackground = AppColors.kWhite});

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
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
        maintainState: true,
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
        tilePadding: EdgeInsets.symmetric(horizontal: 10),
        title: widget.title != null
            ? CommonTextWidget(
                text: widget.title ?? '',
                textAlign: TextAlign.start,
                fontSize: AppSizes.fSize16,
                fontWeight: FontWeight.bold,
                color: AppColors.kcDarkGrayColor,
              )
            : widget.textWidget!,
        children: [
          Container(
            width: double.infinity,
            color: widget.childrenBackground,
            child: Container(
              padding: widget.noPadding == false
                  ? EdgeInsets.symmetric(
                      horizontal: AppSizes.size15,
                      vertical: AppSizes.horizontalMargin)
                  : null,
              child: widget.children != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: widget.spacing ?? 0,
                      children: widget.children ?? [],
                    )
                  : Container(
                      color: Colors.white,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: AppSizes.hSize50,
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                        ),
                        itemCount: widget.itemCount,
                        itemBuilder: (BuildContext context, int index) {
                          return _commonText(
                            title: widget.heading ?? "",
                            subTitle: widget.description ?? "",
                          );
                        },
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _commonText({required String title, required String subTitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CommonTextWidget(
        text: title,
        color: AppColors.kLightGreyText,
        fontSize: AppSizes.fSize14,
        fontWeight: FontWeight.w400,
      ),
      CommonTextWidget(
        text: subTitle,
        color: AppColors.kPrimaryColor,
        fontSize: AppSizes.fSize14,
        fontWeight: FontWeight.w500,
      ),
    ],
  );
}
