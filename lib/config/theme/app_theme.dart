import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lavenderBlush,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: Colors.white),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.chewyTitleStyle,
      titleLarge: AppTextStyles.bubblegumSansSubtitleStyle,
      bodyLarge: AppTextStyles.notoSansBodyStyle,
      bodyMedium: AppTextStyles.notoSansSmallStyle,
      labelLarge: AppTextStyles.notoSansHighlightStyle,
    ),
  );
}
