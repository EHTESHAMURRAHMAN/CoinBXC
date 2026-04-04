import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app_controller.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final appController = Get.find<AppController>();
  final prefs = Get.find<SharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), _navigate);
  }

  void _navigate() {
    Get.offAndToNamed(Routes.ONBOARD);
  }
}
