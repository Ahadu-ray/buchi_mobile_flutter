import 'package:buchi_mobile_flutter/shared/routes/app_routes.dart';
import 'package:buchi_mobile_flutter/ui/pages/home_page.dart';
import 'package:buchi_mobile_flutter/ui/pages/onboarding_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    // introduction pages
    GetPage(
      name: AppRoutes.onboardingPage,
      page: () => const OnBoardingPage(),
    ),

    // main pages
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
    ),
  ];
}
