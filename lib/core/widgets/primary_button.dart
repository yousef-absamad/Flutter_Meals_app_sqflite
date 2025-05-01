import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app_sqflite/core/styels/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? buttonText; 
  final VoidCallback? onPressed; 
  final Color? buttonColor; 
  final Color? textColor; 

  const PrimaryButtonWidget({
    super.key,
     this.buttonText,
     this.onPressed,
     this.buttonColor,
     this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.primaryColor  , 
          padding: const EdgeInsets.symmetric(vertical: 12), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r), 
          ),
        ),
        child: Text(
          buttonText ?? '', 
          style: TextStyle(
            fontSize: 18,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}