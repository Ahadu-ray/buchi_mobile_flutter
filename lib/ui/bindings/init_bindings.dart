import 'package:buchi_mobile_flutter/core/repositories/home_repository.dart';
import 'package:buchi_mobile_flutter/core/services/api_client.dart';
import 'package:buchi_mobile_flutter/ui/controllers/home_controller.dart';
import 'package:buchi_mobile_flutter/utils/constants/data/api_constants.dart';
import 'package:get/get.dart';

// This class is used to initialize certain services and repositories.
// With this class we can inject the services and repositories into the controllers
// We determine which classes will be singletons and which will be instantiated
class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(ApiConstants.url), fenix: true);
    Get.lazyPut(() => HomeRepository(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => HomeController(homeRepository: Get.find()), fenix: true);
  }
}
