import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CustomSnackbarType {
  success,
  error,
  warning,
  info,
}

customSnackbar(String title, String message, CustomSnackbarType type) {
  Get.snackbar(
    title,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    message,
    backgroundColor: type == CustomSnackbarType.success
        ? Colors.green
        : type == CustomSnackbarType.error
            ? Colors.red
            : type == CustomSnackbarType.warning
                ? Colors.orange
                : Colors.blue,
    snackPosition: SnackPosition.TOP,
    colorText: Colors.white,
    duration: const Duration(seconds: 2),
    icon: type == CustomSnackbarType.success
        ? const Icon(
            Icons.check,
            color: Colors.white,
          )
        : type == CustomSnackbarType.error
            ? const Icon(
                Icons.error,
                color: Colors.white,
              )
            : type == CustomSnackbarType.warning
                ? const Icon(
                    Icons.warning,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
  );
}
