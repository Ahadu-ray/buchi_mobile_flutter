import 'package:buchi_mobile_flutter/shared/routes/app_routes.dart';
import 'package:buchi_mobile_flutter/shared/themes/app_theme.dart';
import 'package:buchi_mobile_flutter/utils/constants/assets/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImageConstants.dogImage,
                  ),
                  fit: BoxFit.cover),
            ),
            padding:
                const EdgeInsets.only(left: 20, top: 60, bottom: 40, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * 0.5,
                  child: Text(
                    "Over 200,000 stray dogs on Addis Ababa Streets in 2020!"
                        .toUpperCase(),
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Colors.amber[50],
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    ImageConstants.iconImage,
                    width: 50,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Be Part of the solution",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Adopt a stray pet to decrease the number of stray pets on the street for the safety of every one.",
                  style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 5,
              ),
              Text(
                  "Start your journey of finding your companion now using Buchi app",
                  style: TextStyle(fontSize: 16)),
            ]),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.homePage);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(1, 3), color: Colors.grey)
                ],
              ),
              width: 70,
              height: 70,
              child: Icon(
                Icons.search,
                size: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
