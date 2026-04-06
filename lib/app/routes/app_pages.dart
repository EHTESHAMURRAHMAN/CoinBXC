import 'package:get/get.dart';

import '../modules/assets/bindings/assets_binding.dart';
import '../modules/assets/views/assets_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/futures/bindings/futures_binding.dart';
import '../modules/futures/views/futures_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/market/bindings/market_binding.dart';
import '../modules/market/views/market_view.dart';
import '../modules/onboard/bindings/onboard_binding.dart';
import '../modules/onboard/views/onboard_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/trade/bindings/trade_binding.dart';
import '../modules/trade/views/trade_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARD;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MARKET,
      page: () => const MarketView(),
      binding: MarketBinding(),
    ),
    GetPage(
      name: _Paths.TRADE,
      page: () => const TradeView(),
      binding: TradeBinding(),
    ),
    GetPage(
      name: _Paths.FUTURES,
      page: () => const FuturesView(),
      binding: FuturesBinding(),
    ),
    GetPage(
      name: _Paths.ASSETS,
      page: () => const AssetsView(),
      binding: AssetsBinding(),
    ),
  ];
}
