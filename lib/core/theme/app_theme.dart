import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith();
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    //Add attributes as you want to help in app
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
  );
}
