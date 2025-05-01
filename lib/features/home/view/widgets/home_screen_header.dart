import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_assets/app_assete.dart';
import '../../../../core/styels/app_colors.dart';
import '../../../../core/styels/app_text_styels.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssete.homeIamgeHeader,
          width: double.infinity,
          height: 230.h,
        ),
        Positioned(
          left: 20.w,
          top: 20.h,
          bottom: 20.h,
          child: Container(
            alignment: Alignment.center,
            width: 180.w,
            height: 186.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(48.r),
            ),
    
            child: Text(
              'Welcome Add A New Recipe',
              textAlign: TextAlign.center,
              style: AppTextStyels.onBoardingTitleStyle.copyWith(
                shadows: [
                  BoxShadow(color: Colors.black, blurRadius: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
