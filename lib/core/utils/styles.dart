import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lines_co_test/core/utils/colors.dart';

class AppTextStyles {
  static TextStyle displayLarge = GoogleFonts.dmSans(
    textStyle: TextStyle(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  static TextStyle displayMedium = GoogleFonts.dmSans(
    textStyle: TextStyle(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );

  static TextStyle bodyLarge = GoogleFonts.dmSans(
    textStyle: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  static TextStyle bodyMedium = GoogleFonts.dmSans(
    textStyle: TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.kPrimaryGrey,
    ),
  );
  static TextStyle bodySmall = GoogleFonts.dmSans(
    textStyle: TextStyle(
      fontSize: 13.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  static TextStyle titleMedium = GoogleFonts.dmSans(
    textStyle: TextStyle(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.kPrimaryGrey,
    ),
  );

  static TextStyle labelLarge = GoogleFonts.dmSans(
    textStyle: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xff3AC2CB),
    textTheme: TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      titleMedium: titleMedium,
      labelLarge: labelLarge,
    ),
  );
}
