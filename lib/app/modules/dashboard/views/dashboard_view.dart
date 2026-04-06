import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xfff5f5f5),

        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.pages,
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              label: "Markets",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: "Trade",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: "Futures",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: "Assets",
            ),
          ],
        ),
      ),
    );
  }
}
