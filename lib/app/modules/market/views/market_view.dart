import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/market_controller.dart';

class MarketView extends GetView<MarketController> {
  const MarketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(children: [holdingSpot()]),
        ),
      ),
    );
  }

  Widget holdingSpot() {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TabBar(
                  controller: controller.tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  dividerColor: Colors.transparent,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 10),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.yellow,
                  ),
                  splashFactory: NoSplash.splashFactory,
                  tabs: controller.tabs.map((tab) => Tab(text: tab)).toList(),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.dashboard)),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                Center(child: Text("Holding")),
                Center(child: Text("Spot Trading")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
