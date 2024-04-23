import 'package:aviz/core/constants/app_colors.dart';
import 'package:aviz/core/constants/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    // app bar
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.grey100,
      backgroundColor: AppColors.grey100,
      surfaceTintColor: AppColors.grey100,
      shadowColor: AppColors.grey100,
    ),

    // text button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: AppRadius.md),
        ),
        foregroundColor: const MaterialStatePropertyAll(AppColors.grey400),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SM',
          ),
        ),
      ),
    ),

    // elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: AppRadius.md),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 14, fontFamily: 'SB'),
        ),
        elevation: const MaterialStatePropertyAll(1),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        overlayColor: MaterialStatePropertyAll(
          Colors.white.withOpacity(0.3),
        ),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey700,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey700,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey700,
      ),
      headlineLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey500,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey500,
      ),
      headlineSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'SB',
        color: AppColors.grey500,
      ),
      titleLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey700,
      ),
      titleMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey700,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey700,
      ),
      displayLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey500,
      ),
      displayMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey500,
      ),
      displaySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: AppColors.grey500,
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'SM',
        color: Colors.white,
      ),
    ),
  );
}
