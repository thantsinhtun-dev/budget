import 'package:budget/src/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FontFamily {
  nunito('Nunito'),
  pyidaungsu('Pyidaungsu');

  const FontFamily(this.value);

  final String value;
}

enum FontSize {
  s10(10),
  s12(12),
  s13(13),
  s14(14),
  s15(15),
  s16(16),
  s18(18),
  s20(20),
  s22(22),
  s24(24),
  s28(28),
  s34(34);

  const FontSize(this.value);

  final double value;
}

class AppFontStyle {
  const AppFontStyle(this.context);
  final BuildContext context;

  TextStyle? customFont({
    FontFamily fontFamily = FontFamily.nunito,
    FontSize fontSize = FontSize.s14,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      fontWeight: fontWeight,
      color : color,
    );
  }
  TextStyle? header1({
    FontFamily fontFamily = FontFamily.nunito,
    FontSize fontSize = FontSize.s24,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      fontWeight: fontWeight,
      color : color ?? context.appColors.colorPrimaryText,
    );
  }
  TextStyle? header2({
    FontFamily fontFamily = FontFamily.nunito,
    FontSize fontSize = FontSize.s18,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      fontWeight: fontWeight,
      color : color ?? context.appColors.colorPrimaryText,
    );
  }
  TextStyle? header3({
    FontFamily fontFamily = FontFamily.nunito,
    FontSize fontSize = FontSize.s18,
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      fontWeight: fontWeight,
      color : color ?? context.appColors.colorPrimaryText,
    );
  }

  TextStyle? body1({
    FontFamily fontFamily = FontFamily.nunito,
    FontSize fontSize = FontSize.s16,
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      fontWeight: fontWeight,
      color : color ?? context.appColors.colorPrimaryText,
    );
  }
  TextStyle? body2({
    FontFamily fontFamily = FontFamily.nunito,
    FontSize fontSize = FontSize.s14,
    FontWeight fontWeight = FontWeight.w600,
    Color? color,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      fontWeight: fontWeight,
      color : color ?? context.appColors.colorPrimaryText,
    );
  }
  TextStyle? body3({
    FontFamily fontFamily = FontFamily.nunito,
    FontSize fontSize = FontSize.s12,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      fontWeight: fontWeight,
      color : color ?? context.appColors.colorPrimaryText,
    );
  }
  TextStyle? body4({
    FontFamily fontFamily = FontFamily.nunito,
    FontSize fontSize = FontSize.s10,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      fontWeight: fontWeight,
      color : color ?? context.appColors.colorPrimaryText,
    );
  }

}

extension ContextLocaleExtension on BuildContext {
  AppFontStyle get appFonts => AppFontStyle(this);
}
