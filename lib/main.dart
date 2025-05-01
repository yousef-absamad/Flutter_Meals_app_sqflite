import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app_sqflite/core/routing/routes_generation_config.dart';
import 'package:meal_app_sqflite/features/onboarding/services/on_boarding_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnBoardingServices.initializeSharedPrefrencesStorge();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Meals app',
          routerConfig: RoutesGenerationConfig.goRoute,
        );
      },
    );
  }
}
