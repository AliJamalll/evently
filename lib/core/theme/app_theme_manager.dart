import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class appThemeManager{
  static ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.white
  );

  static ThemeData darkThemeData = ThemeData(
      scaffoldBackgroundColor: AppColors.darkPurple
  );

}