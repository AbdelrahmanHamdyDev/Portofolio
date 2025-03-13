import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData MainTheme = ThemeData().copyWith(
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.ibmPlexMono(
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 130.sp,
        color: Colors.white,
      ),
    ),
    bodyMedium: GoogleFonts.ibmPlexMono(
      textStyle: TextStyle(
        fontSize: 80.sp,
        color: Colors.white,
      ),
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 32.sp,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 24.sp,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 18.sp,
      color: Colors.white,
    ),
  ),
);

ThemeData PhoneTheme = ThemeData().copyWith(
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.ibmPlexMono(
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 150.sp,
        color: Colors.white,
      ),
    ),
    bodyMedium: GoogleFonts.ibmPlexMono(
      textStyle: TextStyle(
        fontSize: 100.sp,
        color: Colors.white,
      ),
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 50.sp,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 40.sp,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 30.sp,
      color: Colors.white,
    ),
  ),
);
