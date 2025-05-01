import 'package:go_router/go_router.dart';
import 'package:meal_app_sqflite/core/routing/app_routes.dart';
import 'package:meal_app_sqflite/features/add_meal/add_meal_screen.dart';
import 'package:meal_app_sqflite/features/home/data/model/meal_model.dart';
import 'package:meal_app_sqflite/features/home/view/screens/home_screen.dart';
import 'package:meal_app_sqflite/features/meal_details/meal_details_screen.dart';
import 'package:meal_app_sqflite/features/onboarding/view/screens/onboarding_screen.dart';

class RoutesGenerationConfig {
  static GoRouter goRoute = GoRouter(
    initialLocation: AppRoutes.onBoardingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.addMealScreen,
        name: AppRoutes.addMealScreen,
        builder: (context, state) => AddMealScreen(),
      ),
      GoRoute(
        path: AppRoutes.mealDetailsScreen,
        name: AppRoutes.mealDetailsScreen,
        builder: (context, state) {
          MealModel meal = state.extra as MealModel;
          return MealDetailsScreen(meal: meal);
        },
      ),
    ],
  );
}
