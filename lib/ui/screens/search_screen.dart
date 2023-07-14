import 'package:buchi_mobile_flutter/ui/components/pet_type_dropdown.dart';
import 'package:buchi_mobile_flutter/ui/controllers/home_controller.dart';
import 'package:buchi_mobile_flutter/ui/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PetTypeDropdown(),
        Obx(
          () => CustomDropDown(
            title: "Good with Children",
            value: _homeController.isGoodwithKids.value,
            hintText: _homeController.isGoodwithKids.value ? "Yes" : "No",
            onChanged: (value) {
              _homeController.isGoodwithKids.value = value;
              _homeController.petToSearch.value = _homeController
                  .petToSearch.value
                  .copyWith(isGoodWithKids: value);
            },
            items: [true, false]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e ? "Yes" : "No"),
                    ))
                .toList(),
            width: Get.width * 0.9,
          ),
        ),
        Obx(
          () => CustomDropDown(
            title: "Age",
            value: _homeController.age.value,
            onChanged: (value) {
              _homeController.age.value = value;
              _homeController.petToSearch.value =
                  _homeController.petToSearch.value.copyWith(age: value);
            },
            items: _homeController.selectableAges
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            width: Get.width * 0.9,
          ),
        ),
        Obx(
          () => CustomDropDown(
            title: "Gender",
            hintText: _homeController.isMale.value ? "Male" : "Female",
            value: _homeController.isMale.value,
            onChanged: (value) {
              _homeController.isMale.value = value;
              _homeController.petToSearch.value =
                  _homeController.petToSearch.value.copyWith(isMale: value);
            },
            items: [true, false]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e ? "Male" : "Female",
                      ),
                    ))
                .toList(),
            width: Get.width * 0.9,
          ),
        ),
        Obx(
          () => CustomDropDown(
            title: "Size",
            value: _homeController.size.value,
            onChanged: (value) {
              _homeController.size.value = value;
              _homeController.petToSearch.value =
                  _homeController.petToSearch.value.copyWith(size: value);
            },
            items: _homeController.selectableSizes
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            width: Get.width * 0.9,
          ),
        ),
      ],
    );
  }
}
