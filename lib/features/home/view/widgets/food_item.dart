import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app_sqflite/core/styels/app_colors.dart';
import 'package:meal_app_sqflite/core/styels/app_text_styels.dart';
import 'package:meal_app_sqflite/core/widgets/spacing_widgets.dart';

class FoodItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String time;
  final double rate;
  final Function() onTap;

  const FoodItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.time,
    required this.rate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.sp),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: 146.w,
                height: 106.h,
                errorWidget: (context, url, error) {
                  return Container(
                    color: Colors.grey[400],
                    width: 146.w,
                    height: 106.h,
                    alignment: Alignment.center,
                    child: Icon(Icons.broken_image, size: 40),
                  );
                },
                progressIndicatorBuilder: (context, url, progress) {
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            const HeightSpace(4),
            SizedBox(
              width: 140,
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyels.mealTitleStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.primaryColor),
                    const WidthSpace(4),
                    Text(
                      rate.toString(),
                      style: AppTextStyels.mealDescriptionStyle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.watch_later, color: AppColors.primaryColor),
                    const WidthSpace(4),
                    SizedBox(
                      width: 40.w,
                      child: Text(
                        time,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyels.mealDescriptionStyle.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
