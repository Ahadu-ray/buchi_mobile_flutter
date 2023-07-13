import 'package:buchi_mobile_flutter/shared/routes/app_pages.dart';
import 'package:buchi_mobile_flutter/shared/routes/app_routes.dart';
import 'package:buchi_mobile_flutter/ui/bindings/init_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.onboardingPage,
      getPages: AppPages.pages,
      initialBinding: InitBinding(),
    );
  }
}
