import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  final showPass = true.obs;

  var isButtonEnabled = false.obs;

  void updateButtonState() {
    isButtonEnabled.value =
        controllerEmail.text.isNotEmpty && controllerPassword.text.isNotEmpty;
  }
}
