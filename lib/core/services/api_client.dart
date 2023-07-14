import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:buchi_mobile_flutter/utils/functions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:http/http.dart';
import 'package:mime/mime.dart';

// This is a sample api client class, it is used to communicate with the backend
// The one to be implemented on your real apps will be with dio.
// It will contain a better error handling and a better way to communicate with the backend
// This is just a sample to show how to use the api client
class ApiClient {
  static String? auth;
  var url;
  var path;
  bool showErrors;
  Map<String, String> headers = {
    'fineract-platform-tenantid': 'default',
    'Content-Type': 'application/json'
  };
  ApiClient(
    String path, {
    bool withToken = false,
    Map<String, String>? extraHeaders,
    this.showErrors = true,
  });

  Future<String?> getData({
    Map<String, dynamic>? parameters,
  }) async {
    Response? response;
    try {
      response = await get(
        Uri.https(url, path, parameters),
        headers: headers,
      );
    } catch (e) {
      showConnectError(e);
      rethrow;
    }
    return response.body;
  }

  Future<String?> setData({
    Map<String, dynamic>? body,
    Map<String, dynamic>? parameters,
  }) async {
    print([Uri.https(this.url, this.path, parameters).toString(), body]);

    Response? response;
    try {
      response = await post(
        Uri.https(this.url, this.path, parameters),
        headers: headers,
        body: jsonEncode(body),
      );
    } catch (e) {
      showConnectError(e);
      print(e);
    }
    return response?.body;
  }

  Future<String?> createData(Object data) async {
    print(Uri.https(this.url, this.path));
    Response? response;
    try {
      response = await post(
        Uri.https(this.url, this.path),
        headers: headers,
        body: jsonEncode(data),
      );
    } catch (e) {
      showConnectError(e);
      print(e);
    }

    return response?.body;
  }

  Future<String?> updateData({
    Map<String, dynamic>? body,
  }) async {
    Response? response;
    try {
      response = await put(
        Uri.https(this.url, this.path),
        headers: headers,
        body: jsonEncode(body),
      );
    } catch (e) {
      showConnectError(e);
      print(e);
    }
    return response?.body;
  }

  Future<String?> deleteData(var id) async {
    final Response response = await delete(
        Uri.https(this.url, this.path + "/" + id.toString()),
        headers: headers);
    return response.body;
  }

  void showConnectError(error) {
    String msg = checkConnectionError(error)
        ? "could_not_connect_to_the_internet"
        : error.toString();
    print(msg);
    if (this.showErrors) showMessage(title: "error", message: msg, error: true);
  }

  void showResponseError(Response response) {
    print(response.body);
    if (!this.showErrors) return;
    String? errorMsg;
    if (response.body.contains("defaultUserMessage")) {
      try {
        var splitError = response.body.split("defaultUserMessage");
        if (splitError.length > 0) {
          errorMsg = splitError[splitError.length - 1].split("\"")[2];
        }
      } catch (e) {}
    }
    if (response.statusCode == 401) {
      errorMsg = "wrong_credentials_please_login_again";
    }
    if (errorMsg == null || errorMsg.isEmpty) {
      errorMsg = "error_connecting_to_server".trParams({
        "statusCode": response.statusCode.toString(),
      });
    }
    showMessage(title: "connection_error", message: errorMsg, error: true);
  }
}
