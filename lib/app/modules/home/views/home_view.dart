import 'package:coinbxc/app/modules/home/widget/bearish.dart';
import 'package:coinbxc/app/modules/home/widget/bullish.dart';
import 'package:coinbxc/app/modules/home/widget/favourite.dart';
import 'package:coinbxc/app/modules/home/widget/new_listing.dart';
import 'package:coinbxc/app/modules/home/widget/tranding.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                totalFunds(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildItem(context, Icons.account_balance_wallet, "Earn"),
                      buildItem(context, Icons.swap_horiz, "Convert"),
                      buildItem(context, Icons.repeat, "Recurring"),
                      buildItem(context, Icons.add_card, "Add Funds"),
                      buildItem(context, Icons.more_horiz, "More"),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    card(context, "BNB", "593.21", "+0.62%"),
                    card(context, "STO", "0.2100", "+41.70%"),
                  ],
                ),
                SizedBox(height: 15),

                tabs(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // favourite , Tranding , Bullish, bearish , new listings
  // ----------------Widgets----------------------
  Widget totalFunds() {
    return Container(
      // padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Est. Total Value (USDT)"),
              const SizedBox(height: 8),
              const Text(
                "9.48",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text("≈₹881.51", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 8),
              const Text(
                "Today's PNL -1.95%",
                style: TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 12),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              
            ),
            child: const Text(
              "Add Funds",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, IconData icon, String title) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget card(BuildContext context, String name, String price, String change) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(price, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 4),
          Text(
            change,
            style: TextStyle(
              color: change.contains('-') ? Colors.red : Colors.green,
            ),
          ),
          const SizedBox(height: 8),
          Container(height: 40, color: Colors.grey.shade200),
        ],
      ),
    );
  }

  Widget tabs() {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          // 🔹 TabBar
          TabBar(
            controller: controller.tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            // indicatorColor: Colors.yellow,
            dividerColor: Colors.transparent,
            labelPadding: const EdgeInsets.symmetric(horizontal: 15),
            indicatorPadding: const EdgeInsets.symmetric(vertical: 10),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.yellow,
            ),
            splashFactory: NoSplash.splashFactory, // ❌ remove ripple
            tabs: controller.tabs.map((tab) => Tab(text: tab)).toList(),
          ),

          // 🔹 TabBarView (IMPORTANT: Expanded)
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                Favourite(),
                Tranding(),
                Bullish(),
                Bearish(),
                NewListing(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
