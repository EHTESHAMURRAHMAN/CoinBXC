import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar({
  int? positin,
  bool type = false,
  String? status,
  String? message,
}) {
  Get.snackbar(
    status?.tr ?? "",
    message?.tr ?? "",
    icon: Icon(type ? Icons.check_circle : Icons.cancel, color: Colors.white),
    snackPosition: positin == 1 ? SnackPosition.BOTTOM : SnackPosition.TOP,
    backgroundColor: type ? Get.theme.primaryColor : Colors.red.shade900,
    borderRadius: 20,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeInToLinear,
  );
}
