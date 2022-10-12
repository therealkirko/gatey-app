
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DialogHelper
{
  static void showErrorDialog({String? message}) {
    Get.snackbar(
      '⚡ Error',
      message!,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      icon: const Icon(
        Icons.error_outline,
        color: Colors.red
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showSuccessDialog({String? message}) {
    Get.snackbar(
      'Success',
      message!,
      shouldIconPulse: true,
      colorText: Colors.black87,
      backgroundColor: Colors.white,
      icon: const Icon(
        Icons.celebration_outlined,
        color: Colors.green
      ),
      snackPosition: SnackPosition.TOP,
    );
  }
}