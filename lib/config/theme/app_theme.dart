import 'package:flutter/material.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lavenderBlush,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.white,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.white,
      background: AppColors.lavenderBlush,
      onBackground: AppColors.darkGrey,
      surface: AppColors.white,
      onSurface: AppColors.darkGrey,
      error: Colors.redAccent,
      onError: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
      titleTextStyle: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: AppColors.white),
      elevation: 0.0,
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.chewyTitleStyle,
      headlineMedium: AppTextStyles.bubblegumSansSubtitleStyle,
      bodyLarge: AppTextStyles.notoSansBodyStyle,
      bodyMedium: AppTextStyles.notoSansSmallStyle,
      titleLarge: AppTextStyles.notoSansHighlightStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.accentYellow),
        foregroundColor: MaterialStateProperty.all(AppColors.darkGrey),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.white,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}