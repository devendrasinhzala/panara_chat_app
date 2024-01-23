import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    background: AppColors.bgColor,
  ),
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      elevation: MaterialStateProperty.resolveWith(
        (states) => 0,
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) => AppColors.accent03,
      ),
    ),
  ),
);
