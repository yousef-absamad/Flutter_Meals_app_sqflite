import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app_sqflite/core/routing/app_routes.dart';
import 'package:meal_app_sqflite/core/styels/app_colors.dart';
import 'package:meal_app_sqflite/core/styels/app_text_styels.dart';
import 'package:meal_app_sqflite/core/widgets/spacing_widgets.dart';
import 'package:meal_app_sqflite/features/home/data/db_helper/db_helper.dart';
import 'package:meal_app_sqflite/features/home/data/model/meal_model.dart';
import 'package:meal_app_sqflite/features/home/view/widgets/food_item.dart';
import 'package:meal_app_sqflite/features/home/view/widgets/home_screen_header.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final DataBaseHelper dataBaseHelper = DataBaseHelper.dbHelper;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HomeScreenHeader(),
            HeightSpace(25),
            Padding(
              padding: EdgeInsets.only(left: 8.sp),
              child: Text('Your Food', style: AppTextStyels.mealTitleStyle),
            ),
            const HeightSpace(20),
            Expanded(
              child: FutureBuilder(
                future: dataBaseHelper.getAllMeals(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 30.h,
                        childAspectRatio: 1.05,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        MealModel meal = snapshot.data![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.sp),
                          child: FoodItem(
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                AppRoutes.mealDetailsScreen,
                                extra: meal,
                              );
                            },
                            imageUrl: meal.imageUrl,
                            name: meal.name,
                            rate: meal.rate,
                            time: meal.time,
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    Text("error : ${snapshot.error}");
                  } else if (snapshot.data!.isEmpty) {
                    Icon(Icons.insert_drive_file, size: 80);
                  }
                  return Placeholder();
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(AppRoutes.addMealScreen);
          },
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.add, color: AppColors.white),
        ),
      ),
    );
  }
}
