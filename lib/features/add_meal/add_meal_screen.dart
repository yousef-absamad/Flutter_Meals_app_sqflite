import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app_sqflite/core/routing/app_routes.dart';
import 'package:meal_app_sqflite/core/styels/app_colors.dart';
import 'package:meal_app_sqflite/core/styels/app_text_styels.dart';
import 'package:meal_app_sqflite/core/widgets/custom_text_field.dart';
import 'package:meal_app_sqflite/core/widgets/primary_button.dart';
import 'package:meal_app_sqflite/core/widgets/spacing_widgets.dart';
import 'package:meal_app_sqflite/features/home/data/db_helper/db_helper.dart';
import 'package:meal_app_sqflite/features/home/data/model/meal_model.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController meaNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descritionController = TextEditingController();
  final DataBaseHelper dbHelper = DataBaseHelper.dbHelper;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text('Add Meal', style: AppTextStyels.mealTitleStyle),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child:
                  isLoading
                      ? SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const HeightSpace(25),
                          Text('Meal Name', style: AppTextStyels.addMealStyle),
                          const HeightSpace(8),
                          CustomTextField(
                            controller: meaNameController,
                            validator: (val) {
                              return val!.isEmpty
                                  ? 'please add meal name'
                                  : val.length < 4
                                  ? 'please enter more than 3 characters'
                                  : null;
                            },
                          ),
                          const HeightSpace(8),
                          Text('Image Url', style: AppTextStyels.addMealStyle),
                          const HeightSpace(8),
                          CustomTextField(
                            controller: imageUrlController,
                            maxLines: 3,
                            validator: (val) {
                              return val!.isEmpty
                                  ? 'please add image Url'
                                  : null;
                            },
                          ),
                          const HeightSpace(8),
                          Text('Rate', style: AppTextStyels.addMealStyle),
                          const HeightSpace(8),
                          CustomTextField(
                            controller: rateController,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              return val!.isEmpty ? 'please add rate' : null;
                            },
                          ),
                          const HeightSpace(8),
                          Text('Time', style: AppTextStyels.addMealStyle),
                          const HeightSpace(8),
                          CustomTextField(
                            controller: timeController,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              return val!.isEmpty ? 'please add time' : null;
                            },
                          ),
                          const HeightSpace(8),
                          Text('Descrition', style: AppTextStyels.addMealStyle),
                          const HeightSpace(8),
                          CustomTextField(
                            controller: descritionController,
                            maxLines: 4,
                            validator: (val) {
                              return val!.isEmpty
                                  ? 'please add descrition'
                                  : null;
                            },
                          ),
                          const HeightSpace(70),
                          PrimaryButtonWidget(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                isLoading = true;
                                setState(() {});
                                MealModel meal = MealModel(
                                  name: meaNameController.text,
                                  imageUrl: imageUrlController.text,
                                  description: descritionController.text,
                                  time: timeController.text,
                                  rate: double.parse(rateController.text),
                                );
                                dbHelper.insertMeal(meal);
                                //isLoading = false;
                                //setState(() {});
                                GoRouter.of(
                                  context,
                                ).pushReplacement(AppRoutes.homeScreen);
                              }
                            },
                            buttonText: 'Add Meal',
                          ),
                          const HeightSpace(30),
                        ],
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
