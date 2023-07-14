import 'package:buchi_mobile_flutter/utils/constants/assets/image_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(ImageConstants.dogImage), fit: BoxFit.cover),
          ),
          margin: const EdgeInsets.all(10),
          height: 200,
        );
      },
      itemCount: 5,
    );
  }
}
