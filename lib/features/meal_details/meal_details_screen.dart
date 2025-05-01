import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app_sqflite/core/styels/app_colors.dart';
import 'package:meal_app_sqflite/core/styels/app_text_styels.dart';
import 'package:meal_app_sqflite/core/widgets/spacing_widgets.dart';
import 'package:meal_app_sqflite/features/home/data/db_helper/db_helper.dart';
import 'package:meal_app_sqflite/features/home/data/model/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  final MealModel meal;
  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: CachedNetworkImage(
                        imageUrl: meal.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 327.h,
                        errorWidget: (context, url, error) {
                          return Container(
                            height: 327.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Icon(Icons.broken_image, size: 100),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: 12.w,
                      top: 12.h,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          borderRadius: BorderRadius.circular(100.sp),
                        ),
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpace(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      meal.name,
                      style: AppTextStyels.mealTitleStyle.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    HeightSpace(21),
                    Container(
                      padding: EdgeInsets.all(8.sp),
                      height: 33.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        color: AppColors.primaryColor.withValues(alpha: 0.09),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: AppColors.primaryColor,
                              ),
                              const WidthSpace(4),
                              SizedBox(
                                width: 100.w,
                                child: Text(
                                  meal.time,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyels.mealDescriptionStyle
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: AppColors.primaryColor),
                              const WidthSpace(4),
                              Text(
                                meal.rate.toString(),
                                style: AppTextStyels.mealDescriptionStyle
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const HeightSpace(27),
                    Divider(thickness: 2, color: Colors.grey[300]),
                    const HeightSpace(21),
                    Text('Description', style: AppTextStyels.mealTitleStyle),
                    Text(
                      meal.description,
                      style: AppTextStyels.mealDescriptionStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            final DataBaseHelper dataBaseHelper = DataBaseHelper.dbHelper;
            dataBaseHelper.deleteMeal(meal.id!);
            GoRouter.of(context).pop();
          },
          child: Icon(Icons.delete, color: Colors.black, size: 30),
        ),
      ),
    );
  }
}
