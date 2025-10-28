import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_strings.dart';
import '../helper/input_formatter.dart';

class CommonStrokeTextWidget extends StatelessWidget {
  final String text;
  final bool translate;
  final bool inherit;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final double? height;
  final TextLeadingDistribution? leadingDistribution;
  final Locale? locale;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final List<FontVariation>? fontVariations;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final String? debugLabel;
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final String? package;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;

  const CommonStrokeTextWidget({
    super.key,
    required this.text,
    this.inherit = true,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.leadingDistribution,
    this.locale,
    this.foreground,
    this.background,
    this.shadows,
    this.fontFeatures,
    this.fontVariations,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.debugLabel,
    this.fontFamily,
    this.fontFamilyFallback,
    this.package,
    this.overflow,
    this.textAlign,
    this.maxLines,
    this.translate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(translate ? formatNumber(text).tr() : formatNumber(text),
      softWrap: true,
      style: TextStyle(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = Colors.black,
        inherit: inherit,
        color: color,
        backgroundColor: backgroundColor,
        fontSize: fontSize?.sp ?? 12.sp,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        height: height?.h,
        leadingDistribution: leadingDistribution,
        locale: locale,
         background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        fontVariations: fontVariations,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        debugLabel: debugLabel,
        fontFamily: fontFamily ?? AppStrings.mawaniFontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        overflow: overflow ?? TextOverflow.ellipsis,),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 20,);
  }
}
