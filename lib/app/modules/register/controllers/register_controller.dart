import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final fireblockAccountiD = "".obs;
  final passwordInstructions =
      'Password length should be 8 characters, at least 1 number, 1 special character, 1 upper case letter and 1 character';
  final termsAndConditions =
      'I have read and understood the Terms and Privacy Policy';

  final GlobalKey<FormState> regiFormKey = GlobalKey<FormState>();

  final isCheckedTerms = false.obs;
  final controllerName = TextEditingController();
  final controllerMobile = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllercPassword = TextEditingController();
  final controllerMPin = TextEditingController();
  final controllerReferral = TextEditingController();

  final showPass = true.obs;
  final hasReferral = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  var isButtonEnabled = false.obs;

  void updateButtonState() {
    // All required fields must be non-empty and passwords must match
    bool allFilled =
        controllerName.text.isNotEmpty &&
        controllerEmail.text.isNotEmpty &&
        controllerPassword.text.isNotEmpty &&
        controllercPassword.text.isNotEmpty &&
        controllerMPin.text.isNotEmpty &&
        controllerPassword.text == controllercPassword.text &&
        isCheckedTerms.value;

    isButtonEnabled.value = allFilled;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
