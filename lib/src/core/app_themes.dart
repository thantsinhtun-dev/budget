import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppThemes {
  ///
  /// Colors from Tailwind CSS
  /// https://tailwindcss.com/docs/customizing-colors

  static const int _primaryColor = 0xFF1F1D2B;
  static const MaterialColor primarySwatch = MaterialColor(_primaryColor, <int, Color>{
    50: Color(0xFF807D95),
    100: Color(0xFF6A6780),
    200: Color(0xFF56526B),
    300: Color(0xFF423F56),
    400: Color(0xFF302D41),
    500: Color(_primaryColor),
    600: Color(0xFF1C1A27),
    700: Color(0xFF191723),
    800: Color(0xFF16141E),
    900: Color(0xFF13111A),
  });


  static const int _textColor = 0xFFCECED1;
  static const MaterialColor textSwatch = MaterialColor(_textColor, <int, Color>{
    50: Color(0xFFE7E7E8),
    100: Color(0xFFE2E2E3),
    200: Color(0xFFDDDDDF),
    300: Color(0xFFD9D9DA),
    400: Color(0xFFD4D4D6),
    500: Color(_textColor),
    600: Color(0xFFBABABC),
    700: Color(0xFFA6A6A7),
    800: Color(0xFF919192),
    900: Color(0xFF7C7C7D),
  });

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: primarySwatch.shade500,
    cardColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    cardTheme: const CardTheme(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    iconTheme: const IconThemeData(color: colorPrimary),
    listTileTheme: const ListTileThemeData(iconColor: primarySwatch),
    dividerColor: const Color(0x1C000000),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: textSwatch.shade500.withOpacity(0.5),
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: textSwatch.shade500,
        fontSize: 57.0,
      ),
      displayMedium: TextStyle(
        color: textSwatch.shade500,
        fontSize: 45.0,
      ),
      displaySmall: TextStyle(
        color: textSwatch.shade500,
        fontSize: 36.0,
      ),
      headlineLarge: TextStyle(
        color: textSwatch.shade500,
        fontSize: 32.0,
      ),
      headlineMedium: TextStyle(
        color: textSwatch.shade500,
        fontSize: 28.0,
      ),
      headlineSmall: TextStyle(
        color: textSwatch.shade500,
        fontSize: 24.0,
      ),
      titleLarge: TextStyle(
        color: textSwatch.shade500,
        fontSize: 22.0,
      ),
      titleMedium: TextStyle(
        color: textSwatch.shade500,
        fontSize: 16.0,
      ),
      titleSmall: TextStyle(
        color: textSwatch.shade500,
        fontSize: 14.0,
      ),
      labelLarge: TextStyle(
        color: textSwatch.shade500,
        fontSize: 14.0,
      ),
      labelMedium: TextStyle(
        color: textSwatch.shade500,
        fontSize: 12.0,
      ),
      labelSmall: TextStyle(
        color: textSwatch.shade500,
        fontSize: 11.0,
      ),
      bodyLarge: TextStyle(
        color: textSwatch.shade500,
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        color: textSwatch.shade500,
        fontSize: 14.0,
      ),
      bodySmall: TextStyle(
        color: textSwatch.shade500,
        fontSize: 12.0,
      ),
    ),
    checkboxTheme: const CheckboxThemeData(),
    switchTheme: const SwitchThemeData().copyWith(),

    radioTheme:  const RadioThemeData(
      visualDensity: VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      // fillColor: colorPrimaryLight
    ),
    appBarTheme: const AppBarTheme(
        color: primarySwatch, iconTheme: IconThemeData(color: Colors.white)),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch)
        .copyWith(background: Colors.white),
  );

  static final darkTheme = lightTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primarySwatch.shade500,
    cardColor: const Color(0xFF2f2f34),
    dialogBackgroundColor: const Color(0xFF2f2f34),
    iconTheme: const IconThemeData(color: colorPrimary),
    dividerColor: const Color(0x1CFFFFFF),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: textSwatch.shade50.withAlpha(50),
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: textSwatch.shade500,
        fontSize: 57.0,
      ),
      displayMedium: TextStyle(
        color: textSwatch.shade500,
        fontSize: 45.0,
      ),
      displaySmall: TextStyle(
        color: textSwatch.shade500,
        fontSize: 36.0,
      ),
      headlineLarge: TextStyle(
        color: textSwatch.shade500,
        fontSize: 32.0,
      ),
      headlineMedium: TextStyle(
        color: textSwatch.shade500,
        fontSize: 28.0,
      ),
      headlineSmall: TextStyle(
        color: textSwatch.shade500,
        fontSize: 24.0,
      ),
      titleLarge: TextStyle(
        color: textSwatch.shade500,
        fontSize: 22.0,
      ),
      titleMedium: TextStyle(
        color: textSwatch.shade500,
        fontSize: 16.0,
      ),
      titleSmall: TextStyle(
        color: textSwatch.shade500,
        fontSize: 14.0,
      ),
      labelLarge: TextStyle(
        color: textSwatch.shade500,
        fontSize: 14.0,
      ),
      labelMedium: TextStyle(
        color: textSwatch.shade500,
        fontSize: 12.0,
      ),
      labelSmall: TextStyle(
        color: textSwatch.shade500,
        fontSize: 11.0,
      ),
      bodyLarge: TextStyle(
        color: textSwatch.shade500,
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        color: textSwatch.shade500,
        fontSize: 14.0,
      ),
      bodySmall: TextStyle(
        color: textSwatch.shade500,
        fontSize: 12.0,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFF35353a)),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch)
        .copyWith(background: Colors.black),
    appBarTheme: const AppBarTheme(color: primarySwatch),
  );

  static const SystemUiOverlayStyle lightOverlayStyle = SystemUiOverlayStyle(
    systemStatusBarContrastEnforced: false,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarContrastEnforced: false,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const SystemUiOverlayStyle darkOverlayStyle = SystemUiOverlayStyle(
    systemStatusBarContrastEnforced: false,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarContrastEnforced: false,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );
}
