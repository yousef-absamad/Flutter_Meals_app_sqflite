import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingServices {
  static late SharedPreferences sharedPref;

  static Future initializeSharedPrefrencesStorge() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static bool isFirstTime() {
    bool isFirstTime = sharedPref.getBool('isFirstTime') ?? true;
    return isFirstTime;
  }

  static setFirstTimeWithFalse() {
    sharedPref.setBool('isFirstTime', false);
  }
}
