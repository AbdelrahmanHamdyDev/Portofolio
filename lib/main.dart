import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/homeScreen/home.dart';
import 'package:portfolio/Theme.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (_, child) {
        ThemeData usingTheme = MainTheme;
        if (ScreenUtil().screenHeight > ScreenUtil().screenWidth) {
          usingTheme = PhoneTheme;
        }
        return MaterialApp(
          theme: usingTheme,
          home: const HamdyHome(),
        );
      },
    ),
  );
}
