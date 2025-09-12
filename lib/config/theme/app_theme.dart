import 'package:flutter/material.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData (
      scaffoldBackgroundColor: AppColors.lavenderBlush,
      primaryColor: AppColors.primaryColor,

    colorScheme: ColorScheme(
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.secondaryColor,
      onSecondary: Colors.white,
      tertiary: AppColors.accentYellow,
      background: AppColors.lavenderBlush,
      onBackground: AppColors.darkGrey,
      surface: Colors.white,
      onSurface: AppColors.darkGrey,
      error: Colors.redAccent,
      onError: Colors.white,
      brightness: Brightness.light
    ),


    textTheme: TextTheme(
      headlineLarge: AppStyles.chewyTitleStyle,
      headlineMedium: AppStyles.bubblegumSansSubtitleStyle,
      bodyLarge: AppStyles.notoSansBodyStyle,
      bodyMedium: AppStyles.notoSansSmallStyle,
      titleLarge: AppStyles.notoSansHighlightStyle,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      titleTextStyle: AppStyles.bubblegumSansSubtitleStyle,
      elevation: 0.0,
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.accentYellow,
      textTheme: ButtonTextTheme.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:  MaterialStateProperty.all(AppColors.accentYellow),
          foregroundColor:  MaterialStateProperty.all(AppColors.darkGrey),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),

      ),
    ),
      cardTheme: CardThemeData(
      color: Colors.white,
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  ),
      );
}