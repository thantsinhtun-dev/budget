import 'package:flutter/material.dart';

const colorPrimary = Color(0xFFEDEDED);
const colorSecondary = Color(0xFF0D47A1);
const colorYellow = Color(0xFFFFD700);
const colorAccent = Color(0xFF6F6FC8);
const colorGrey = Color(0xFF5D5D5D);
const colorPrimaryText = Color(0xFF000000);
const colorSecondaryText = Color(0xFF8F8E95);
const colorWhite = Color(0xFFFFFFFF);
const colorGreen = Color(0xFF28A745);
const colorRed = Color(0xFFDC3545);

class AppColors {
  final Color colorPrimary;
  final Color colorSecondary;
  final Color colorYellow;
  final Color colorAccent;
  final Color colorGrey;
  final Color colorPrimaryText;
  final Color colorSecondaryText;
  final Color colorWhite;
  final Color colorGreen;
  final Color colorRed;

  AppColors(
      this.colorPrimary,
      this.colorSecondary,
      this.colorYellow,
      this.colorAccent,
      this.colorGrey,
      this.colorPrimaryText,
      this.colorSecondaryText,
      this.colorWhite,
      this.colorGreen,
      this.colorRed,
      );
}

final _appColorLight = AppColors(
  colorPrimary,
  colorSecondary,
  colorYellow,
  colorAccent,
  colorGrey,
  colorPrimaryText,
  colorSecondaryText,
  colorWhite,
  colorGreen,
  colorRed,
);
final _appColorDark = AppColors(
  colorPrimary,
  colorSecondary,
  colorYellow,
  colorAccent,
  colorGrey,
  colorPrimaryText,
  colorSecondaryText,
  colorWhite,
  colorGreen,
  colorRed,
);

extension AppTheme on ThemeData {
  AppColors get appColors =>
      brightness == Brightness.light ? _appColorLight : _appColorDark;
}

extension ContextThemeExtension on BuildContext {
  bool get isLightTheme => Theme.of(this).brightness == Brightness.light;

  AppColors get appColors => Theme.of(this).appColors;
}
