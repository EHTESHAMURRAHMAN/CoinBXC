import 'package:coinbxc/app/modules/assets/views/assets_view.dart';
import 'package:coinbxc/app/modules/futures/views/futures_view.dart';
import 'package:coinbxc/app/modules/home/views/home_view.dart';
import 'package:coinbxc/app/modules/market/views/market_view.dart';
import 'package:coinbxc/app/modules/trade/views/trade_view.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  final pages = [
    HomeView(),
    MarketView(),
    TradeView(),
    FuturesView(),
    AssetsView(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
