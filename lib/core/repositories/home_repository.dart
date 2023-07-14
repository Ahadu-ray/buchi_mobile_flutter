import 'package:buchi_mobile_flutter/core/services/api_client.dart';

// This class ingects the api client and comunicate with the backend through that.
// only related requests are put together like getPets() and createPet()
// this class is used in the controller to get the data from the backend
// There will only be one instance of this class in the app, there will be a singleton
// initialized in the init_binding.dart file
class HomeRepository {
  ApiClient apiClient;

  HomeRepository({
    required this.apiClient,
  });

  // specific data types should be used instead of dynamic, from models folder
  Future<dynamic> getPets(dynamic parameters) async {
    return await apiClient.getData(parameters: {});
  }

  createPet(Map<String, dynamic> body) async {
    return await apiClient.setData(body: body, parameters: {});
  }
}
