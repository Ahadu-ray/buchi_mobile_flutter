import 'package:buchi_mobile_flutter/shared/themes/app_theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDown extends StatelessWidget {
  String? hintText;
  String? title;
  dynamic value;
  final ValueSetter<dynamic> onChanged;
  final double? width;
  final List<DropdownMenuItem> items;

  CustomDropDown(
      {super.key,
      this.title,
      this.hintText,
      required this.value,
      required this.onChanged,
      this.width,
      required this.items})
      : localValue = hintText ?? value;

  dynamic localValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (title != null)
            Text(
              title!,
              style: TextStyle(fontSize: 18, color: Colors.grey[20]),
            ),
          DropdownButton2(
            customButton: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              width: width ?? Get.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    localValue.toString(),
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 14, color: AppTheme.secondaryColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: AppTheme.secondaryColor,
                  )
                ],
              ),
            ),
            items: items,
            value: value,
            onChanged: (value) {
              localValue = hintText ?? value;
              onChanged(value);
            },
            underline: SizedBox(),
          ),
        ],
      ),
    );
  }
}
