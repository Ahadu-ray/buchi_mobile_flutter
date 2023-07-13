import 'package:buchi_mobile_flutter/shared/themes/app_theme.dart';
import 'package:buchi_mobile_flutter/ui/controllers/home_controller.dart';
import 'package:buchi_mobile_flutter/ui/widgets/custom_dropdown.dart';
import 'package:buchi_mobile_flutter/ui/widgets/custom_dropdown_item.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetTypeDropdown extends StatelessWidget {
  const PetTypeDropdown({super.key});

  HomeController get _homeController => Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomDropDown(
        hintText: _homeController.selectedPets.isNotEmpty
            ? _homeController.selectedPets.join(", ")
            : "Select Pets",
        items: _homeController.selectablePets
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: CustomDropDownItem(
                    pet: e,
                    isSelected: _homeController.selectedPets.contains(e),
                    onChange: (value) {
                      _homeController.selectPets(e);
                      Navigator.pop(context);
                    },
                  ),
                ))
            .toList(),
        value: _homeController.tempPet,
        onChanged: (value) {},
      );
    });
  }
}
