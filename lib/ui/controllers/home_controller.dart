import 'package:buchi_mobile_flutter/core/models/base_models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final petToSearch = PetToSearch().obs;

  final selectablePets = ["Dogs", "Cats", "Others"].obs;
  final selectableAges = [
    "Baby",
    "Young",
    "Adult",
    "Senior",
  ].obs;
  final selectableSizes = [
    "Small",
    "Medium",
    "Large",
    "Extra Large",
  ].obs;
  var tempPet = "Dogs";
  final selectedPets = <String>[].obs;
  var isGoodwithKids = false.obs;
  var age = "Baby".obs;
  var isMale = false.obs;
  var size = "Small".obs;

  @override
  void onInit() {
    super.onInit();
  }

  selectPets(String pet) {
    if (selectedPets.contains(pet)) {
      selectedPets.remove(pet);
    } else {
      selectedPets.add(pet);
    }
    tempPet = pet;
  }
}
