import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app_sqflite/core/app_assets/app_assete.dart';
import 'package:meal_app_sqflite/core/routing/app_routes.dart';
import 'package:meal_app_sqflite/core/styels/app_colors.dart';
import 'package:meal_app_sqflite/core/styels/app_text_styels.dart';
import 'package:meal_app_sqflite/core/widgets/spacing_widgets.dart';
import 'package:meal_app_sqflite/features/onboarding/model/onboarding_model.dart';
import 'package:meal_app_sqflite/features/onboarding/services/on_boarding_services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingModel> onboardingModel = [
    OnboardingModel(
      title: 'Save Your Meals Ingredient',
      descripition:
          'Add Your Meals and its Ingredients and we will save it for you',
    ),
    OnboardingModel(
      title: 'Use Our App The Best Choice',
      descripition: 'the best choice for your kitchen do not hesitate',
    ),
    OnboardingModel(
      title: 'Our App Your Ultimate Choice',
      descripition:
          'All the best restaurants and their top menus are ready for you',
    ),
  ];

  double currentIndex = 0;
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkIfFirstTime();
    });
  }

  Future<void> checkIfFirstTime() async {
    final isFirstTime = OnBoardingServices.isFirstTime();
    if (!isFirstTime) {
      context.pushReplacementNamed(AppRoutes.homeScreen);
    } else {
      await OnBoardingServices.setFirstTimeWithFalse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssete.onboardingImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            right: 32.w,
            left: 32.w,
            child: Container(
              width: 311.w,
              height: 400.h,
              padding: EdgeInsets.all(32.sp),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 220.0.h,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index.toDouble();
                        });
                      },
                    ),
                    items:
                        onboardingModel.map((i) {
                          return SizedBox(
                            width: 252.w,
                            child: Column(
                              children: [
                                Text(
                                  i.title,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyels.onBoardingTitleStyle,
                                ),
                                HeightSpace(16),
                                Text(
                                  i.descripition,
                                  textAlign: TextAlign.center,
                                  style:
                                      AppTextStyels.onBoardingDiscriptionStyle,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                  DotsIndicator(
                    onTap: (position) {
                      carouselController.animateToPage(position);
                      currentIndex = position.toDouble();
                      setState(() {});
                    },
                    dotsCount: 3,
                    position: currentIndex,
                    decorator: DotsDecorator(
                      size: Size(24, 6),
                      activeSize: const Size(24.0, 6.0),

                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  const HeightSpace(36),
                  currentIndex >= 2
                      ? InkWell(
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).pushReplacementNamed(AppRoutes.homeScreen);
                        },
                        child: Container(
                          width: 62.w,
                          height: 62.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(84.r),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 35,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                      : Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                GoRouter.of(
                                  context,
                                ).pushReplacementNamed(AppRoutes.homeScreen);
                              },
                              child: Text(
                                'Skip',
                                style: AppTextStyels.onBoardingNextAndSkipStyle,
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                if (currentIndex < onboardingModel.length - 1) {
                                  carouselController.nextPage();
                                }
                              },
                              child: Text(
                                'Next',
                                style: AppTextStyels.onBoardingNextAndSkipStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
