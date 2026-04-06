import 'package:coinbxc/app/modules/assets/controllers/assets_controller.dart';
import 'package:coinbxc/app/modules/futures/controllers/futures_controller.dart';
import 'package:coinbxc/app/modules/home/controllers/home_controller.dart';
import 'package:coinbxc/app/modules/market/controllers/market_controller.dart';
import 'package:coinbxc/app/modules/trade/controllers/trade_controller.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
    Get.put<HomeController>(HomeController());
    Get.put<MarketController>(MarketController());
    Get.put<TradeController>(TradeController());
    Get.put<FuturesController>(FuturesController());
    Get.put<AssetsController>(AssetsController());
  }
}
