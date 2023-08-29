import 'package:expense/app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ThemeData appThemeData = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Inter',
  textTheme: Typography().black.apply(
        fontFamily: 'Inter',
        bodyColor: dark100,
        displayColor: dark100,
      ),
  scaffoldBackgroundColor: light100,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(color: dark100, weight: 10),
    iconTheme: IconThemeData(color: dark100),
    backgroundColor: light100,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Intel',
      color: dark100,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    surfaceTintColor: Get.isDarkMode ? dark100 : light100,
  ),
  dialogBackgroundColor: bgPrimary,
  primaryColor: Color.fromARGB(255, 174, 242, 135),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: light100,
    onPrimary: yellow20,
    secondary: bgPrimary,
    onSecondary: violet20,
    primaryContainer: light100,
    error: Colors.black,
    onError: Colors.white,
    background: light100,
    onBackground: light100,
    surface: light100,
    onSurface: light100,
    secondaryContainer: bgPrimary,
    inversePrimary: dark100,
  ),
);

final ThemeData darkAppThemeData = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Inter',
  useMaterial3: true,
  textTheme: Typography().white.apply(
        fontFamily: 'Inter',
        bodyColor: light100,
        displayColor: light100,
      ),
  shadowColor: Colors.grey.shade900,
  brightness: Brightness.dark,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: bgPrimaryDark,
    onPrimary: bgPrimaryDark,
    secondary: bgSecondaryDark,
    onSecondary: bgSecondaryDark,
    primaryContainer: bgSecondaryDark,
    error: Colors.black,
    onError: Colors.white,
    background: bgPrimaryDark,
    onBackground: bgPrimaryDark,
    surface: bgSecondaryDark,
    onSurface: bgSecondaryDark,
    secondaryContainer: bgPrimaryDark,
    inversePrimary: light100,
  ),
  dialogBackgroundColor: bgSecondaryDark,
  scaffoldBackgroundColor: bgPrimaryDark,
  primaryColor: violet100,
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(color: light100),
    iconTheme: IconThemeData(color: light100),
    backgroundColor: bgPrimaryDark,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Intel',
      color: light100,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    surfaceTintColor: bgPrimaryDark,
  ),
  primarySwatch: Colors.deepPurple,
);

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    background: Color(0XFF161719),
    error: Color(0X330D0E0F),
    errorContainer: Color(0XFFE31837),
    inversePrimary: Color(0XFF161719),
    inverseSurface: Color(0X330D0E0F),
    onBackground: Color(0XFF90909F),
    onError: Color(0X008B50FF),
    onErrorContainer: Color(0X9BFFFFFF),
    onInverseSurface: Color(0X008B50FF),
    onPrimary: Color(0X330D0E0F),
    onPrimaryContainer: Color(0XFF90909F),
    onSecondary: Color(0XFF90909F),
    onSecondaryContainer: Color(0X330D0E0F),
    onSurface: Color(0XFF90909F),
    onSurfaceVariant: Color(0X330D0E0F),
    onTertiary: Color(0XFF90909F),
    onTertiaryContainer: Color(0X330D0E0F),
    outline: Color(0X330D0E0F),
    outlineVariant: Color(0XFF161719),
    primary: Color(0XFF7E3DFF),
    primaryContainer: Color(0XFF161719),
    scrim: Color(0XFF161719),
    secondary: Color(0XFF161719),
    secondaryContainer: Color(0XFF126BC5),
    shadow: Color(0X330D0E0F),
    surface: Color(0XFF161719),
    surfaceTint: Color(0X330D0E0F),
    surfaceVariant: Color(0XFF126BC5),
    tertiary: Color(0XFF161719),
    tertiaryContainer: Color(0XFF126BC5),
  );

  static const primaryColorSchemeDark = ColorScheme.dark(
    background: Color(0XFF161719),
    error: Color(0X330D0E0F),
    errorContainer: Color(0XFFE31837),
    inversePrimary: Color(0XFF161719),
    inverseSurface: Color(0X330D0E0F),
    onBackground: Color(0XFF90909F),
    onError: Color(0X008B50FF),
    onErrorContainer: Color(0X9BFFFFFF),
    onInverseSurface: Color(0X008B50FF),
    onPrimary: Color(0X330D0E0F),
    onPrimaryContainer: Color(0XFF90909F),
    onSecondary: Color(0XFF90909F),
    onSecondaryContainer: Color(0X330D0E0F),
    onSurface: Color(0XFF90909F),
    onSurfaceVariant: Color(0X330D0E0F),
    onTertiary: Color(0XFF90909F),
    onTertiaryContainer: Color(0X330D0E0F),
    outline: Color(0X330D0E0F),
    outlineVariant: Color(0XFF161719),
    primary: Color(0XFF7E3DFF),
    primaryContainer: Color(0XFF161719),
    scrim: Color(0XFF161719),
    secondary: Color(0XFF161719),
    secondaryContainer: Color(0XFF126BC5),
    shadow: Color(0X330D0E0F),
    surface: Color(0XFF161719),
    surfaceTint: Color(0X330D0E0F),
    surfaceVariant: Color(0XFF126BC5),
    tertiary: Color(0XFF161719),
    tertiaryContainer: Color(0XFF126BC5),
  );
}

class PrimaryColors {
  // Amber
  Color get amber500 => Color(0XFFFFC107);
  Color get amberA700 => Color(0XFFFCAC12);
  // Black
  Color get black900 => Color(0XFF000000);
  // Blue
  Color get blue100 => Color(0XFFBCDBFF);
  // BlueGray
  Color get blueGray100 => Color(0XFFD2D2D2);
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray900 => Color(0XFF292B2D);
  // DeepOrange
  Color get deepOrange50 => Color(0XFFFFE2E4);
  // DeepPurple
  Color get deepPurple100 => Color(0XFFD3BCFF);
  Color get deepPurple50 => Color(0XFFEEE5FF);
  Color get deepPurpleA100 => Color(0XFFB189FF);
  Color get deepPurpleA400 => Color(0XFF5233FF);
  // DeepPurpleAd
  Color get deepPurpleA2003d => Color(0X3D8B4FFF);
  // Gray
  Color get gray100 => Color(0XFFF1F1FA);
  Color get gray10001 => Color(0XFFF6F6F6);
  Color get gray300 => Color(0XFFE0E2E9);
  Color get gray30001 => Color(0XFFE3E5E5);
  Color get gray400 => Color(0XFFC5C5C5);
  Color get gray50 => Color(0XFFFBFBFB);
  Color get gray900 => Color(0XFF212224);
  // Indigo
  Color get indigo900 => Color(0XFF27346A);
  // LightBlue
  Color get lightBlue900 => Color(0XFF004685);
  Color get lightBlueA700 => Color(0XFF0077FF);
  // Orange
  Color get orange50 => Color(0XFFFCEED3);
  Color get orange5000 => Color(0X00F7ECD7);
  Color get orange5001 => Color(0XFFFFF6E5);
  // Red
  Color get red100 => Color(0XFFFDD4D7);
  Color get red500 => Color(0XFFFD3C4A);
  // Teal
  Color get teal50 => Color(0XFFCFF9EA);
  Color get teal500 => Color(0XFF00A86B);
  // Yellow
  Color get yellow100 => Color(0XFFFEEED0);
}
