import 'package:buchi_mobile_flutter/shared/themes/app_theme.dart';
import 'package:buchi_mobile_flutter/utils/constants/assets/image_constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(children: [
            Image.asset(
              ImageConstants.iconImage,
              width: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Buchi",
              style: TextStyle(
                  color: AppTheme.secondaryColor,
                  fontSize: 30,
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
