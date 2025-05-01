import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app_sqflite/core/styels/app_colors.dart';

class AppTextStyels {
  static TextStyle onBoardingTitleStyle = GoogleFonts.inter(fontSize: 32.sp , fontWeight: FontWeight.w700 , color: AppColors.white);
  static TextStyle onBoardingDiscriptionStyle = GoogleFonts.inter(fontSize: 14.sp , fontWeight: FontWeight.normal , color: AppColors.white);
  static TextStyle onBoardingNextAndSkipStyle = GoogleFonts.inter(fontSize: 14.sp , fontWeight: FontWeight.w600 , color: AppColors.white);
  static TextStyle mealTitleStyle = GoogleFonts.inter(fontSize: 16.sp , fontWeight: FontWeight.w600 , color: AppColors.black);
  static TextStyle addMealStyle = GoogleFonts.inter(fontSize: 14.sp , fontWeight: FontWeight.w500 , color: AppColors.black);
  static TextStyle mealDescriptionStyle = GoogleFonts.inter(fontSize: 14.sp , fontWeight: FontWeight.normal , color:Color(0xff878787));
}

