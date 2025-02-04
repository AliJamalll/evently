import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class appThemeManager{
  static ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.white
  );

  static ThemeData darkThemeData = ThemeData(
      scaffoldBackgroundColor: AppColors.darkPurple,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkPurple,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold),
      selectedIconTheme: const IconThemeData(
        color: Colors.white,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.white,
      ),
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
    )
  );

}