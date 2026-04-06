import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/futures_controller.dart';

class FuturesView extends GetView<FuturesController> {
  const FuturesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FuturesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FuturesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
