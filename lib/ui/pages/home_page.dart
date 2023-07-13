import 'package:buchi_mobile_flutter/shared/themes/app_theme.dart';
import 'package:buchi_mobile_flutter/ui/components/page_with_appbar.dart';
import 'package:buchi_mobile_flutter/ui/components/pet_type_dropdown.dart';
import 'package:buchi_mobile_flutter/ui/controllers/home_controller.dart';
import 'package:buchi_mobile_flutter/ui/widgets/custom_dropdown.dart';
import 'package:buchi_mobile_flutter/ui/widgets/custom_dropdown_item.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _controller = PageController();

  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          PageWithAppBar(
              child: Column(
            children: [
              PetTypeDropdown(),
              Obx(
                () => CustomDropDown(
                  title: "Good with Children",
                  value: _homeController.isGoodwithKids.value,
                  onChanged: (value) {
                    _homeController.isGoodwithKids.value = value;
                    _homeController.petToSearch.value = _homeController
                        .petToSearch.value
                        .copyWith(isGoodWithKids: value);
                  },
                  items: ["Yes", "No"]
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
                  value: _homeController.isMale.value ? "Male" : "Female",
                  onChanged: (value) {
                    _homeController.isMale.value = value;
                    _homeController.petToSearch.value = _homeController
                        .petToSearch.value
                        .copyWith(isMale: value);
                  },
                  items: ["Male", "Female"]
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
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "home"),
      ]),
    );
  }
}
