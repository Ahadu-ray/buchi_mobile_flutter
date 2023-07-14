import 'package:flutter/material.dart';
import 'package:get/get.dart';

showMessage({
  required String title,
  required String message,
  bool success = false,
  bool error = false,
}) {
  Widget? icon;
  if (success) {
    icon = Icon(Icons.check_circle, color: Colors.green);
  }
  if (error) {
    icon = Icon(Icons.error, color: Colors.red);
  }
  Get.snackbar(
    title.tr,
    message.tr,
    icon: icon,
    duration: Duration(seconds: 3),
    messageText: Text(message),
  );
}

bool checkConnectionError(e) {
  if (e.toString().contains('SocketException') ||
      e.toString().contains('HandshakeException')) {
    return true;
  } else {
    return false;
  }
}
