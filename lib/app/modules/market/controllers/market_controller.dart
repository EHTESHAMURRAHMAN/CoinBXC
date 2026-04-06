import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarketController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final tabs = ["Holding", "spot"];
  late TabController tabController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
