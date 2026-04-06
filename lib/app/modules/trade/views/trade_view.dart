import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/trade_controller.dart';

class TradeView extends GetView<TradeController> {
  const TradeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              headingTop(),
              SizedBox(height: 15),
              Expanded(
                // Wrap priceList with Expanded
                child: priceList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headingTop() {
    return Row(
      children: [
        Text(
          "USDT",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
        ),
        Spacer(),
        Text("Margin"),
        SizedBox(width: 5),

        IconButton(
          onPressed: () {},
          icon: Icon(Icons.candlestick_chart_outlined),
        ),
      ],
    );
  }

  Widget priceList(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  crossButton(context, text: "Cross", ontap: () {}),
                  crossButton(context, text: "5x", ontap: () {}),
                  crossButton(context, text: "Auto", ontap: () {}),
                  crossButton(context, text: "B/R", ontap: () {}),
                ],
              ),
              const SizedBox(height: 5), // ----Buy sell Tab------------
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(tabs: co),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Align(alignment: Alignment.topRight, child: Text("Margin Level")),
            ],
          ),
        ),
      ],
    );
  }

  Widget crossButton(
    BuildContext context, {
    String? text,
    VoidCallback? ontap,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).focusColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text("$text"),
      ),
    );
  }

  //
}
