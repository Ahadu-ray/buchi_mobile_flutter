// This file contains models that are used in the app
// The main apps will use freezed to generate the models, making them immutable
// This is just a sample to show how to use models
class SelectablePetModel {
  String name;
  bool isSelected;

  SelectablePetModel({
    required this.name,
    this.isSelected = false,
  });
}

class PetToSearch {
  String? type;
  bool? isGoodWithKids;
  String? age;
  bool? isMale;
  String? size;

  PetToSearch({
    this.type,
    this.isGoodWithKids,
    this.age,
    this.isMale,
    this.size,
  });

  PetToSearch copyWith({
    String? type,
    bool? isGoodWithKids,
    String? age,
    bool? isMale,
    String? size,
  }) =>
      PetToSearch(
        type: type ?? this.type,
        isGoodWithKids: isGoodWithKids ?? this.isGoodWithKids,
        age: age ?? this.age,
        isMale: isMale ?? this.isMale,
        size: size ?? this.size,
      );
}
