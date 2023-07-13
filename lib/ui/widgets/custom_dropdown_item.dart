import 'package:buchi_mobile_flutter/core/models/base_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDownItem extends StatefulWidget {
  final String pet;
  final ValueSetter<bool> onChange;
  final bool isSelected;
  const CustomDropDownItem({
    super.key,
    required this.pet,
    required this.onChange,
    this.isSelected = false,
  });

  @override
  State<CustomDropDownItem> createState() => _CustomDropDownItemState();
}

class _CustomDropDownItemState extends State<CustomDropDownItem> {
  bool value = false;

  @override
  void initState() {
    value = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.pet),
        CupertinoSwitch(
            value: value,
            onChanged: (value) {
              setState(() {
                this.value = value;
                widget.onChange(value);
              });
            }),
      ],
    );
  }
}
