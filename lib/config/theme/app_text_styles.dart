import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';

class AppStyles {
  static final TextStyle chewyTitleStyle = GoogleFonts.chewy(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.mediumPurple,
  );
  static final TextStyle bubblegumSansSubtitleStyle = GoogleFonts.bubblegumSans(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );
  static final TextStyle notoSansBodyStyle = GoogleFonts.notoSans(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );
  static final TextStyle notoSansSmallStyle = GoogleFonts.notoSans(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );
  static final TextStyle notoSansHighlightStyle = GoogleFonts.notoSans(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.mediumPurple,
  );
}