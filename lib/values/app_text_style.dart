import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static const String sfProDisplay = 'SF Pro Display';
  static const String sfProText = 'SF Pro Text';

  //SF Pro Display
  static final textLight = TextStyle(
    decoration: TextDecoration.none,
    fontFamily: sfProDisplay,
    fontWeight: FontWeight.w300,
    fontSize: 16.sp,
    color: Colors.black,
  );
  static final textRegular = TextStyle(
    decoration: TextDecoration.none,
    fontFamily: sfProDisplay,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 16.sp,
  );
  static final textBold = TextStyle(
    decoration: TextDecoration.none,
    fontFamily: sfProDisplay,
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    color: Colors.black,
  );

  //SF Pro Text
  static final textRegularSF = TextStyle(
    decoration: TextDecoration.none,
    fontFamily: sfProText,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 16.sp,
  );
  static final textMediumSF = TextStyle(
    decoration: TextDecoration.none,
    fontFamily: sfProText,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 16.sp,
  );
  static final textBoldSF = TextStyle(
    decoration: TextDecoration.none,
    fontFamily: sfProText,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 16.sp,
  );
}
