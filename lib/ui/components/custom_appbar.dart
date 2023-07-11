import 'package:buchi_mobile_flutter/shared/themes/app_theme.dart';
import 'package:buchi_mobile_flutter/utils/constants/assets/image_constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Row(children: [
            Image.asset(
              ImageConstants.iconImage,
              width: 50,
            ),
            Text(
              "Buchi",
              style: TextStyle(
                  color: AppTheme.secondaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            )
          ]),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 30,
                color: AppTheme.secondaryColor,
              ))
        ],
      ),
    );
  }
}
