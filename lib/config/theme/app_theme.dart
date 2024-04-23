import 'package:aviz/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.primary,
      onSecondary: Colors.white,
      error: AppColors.primary,
      onError: Colors.white,
      background: AppColors.grey100,
      onBackground: AppColors.grey500,
      surface: AppColors.grey300,
      onSurface: AppColors.grey700,
    ),

    // text theme
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey700,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey700,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey700,
      ),
      headlineLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey500,
      ),
      headlineMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey500,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey500,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey700,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey700,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey700,
      ),
      displayLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey500,
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey500,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey500,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: Colors.white,
      ),
    ),
  );
}
