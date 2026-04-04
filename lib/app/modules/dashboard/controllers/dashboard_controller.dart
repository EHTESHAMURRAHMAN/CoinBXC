import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final RxBool isLoading = false.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
