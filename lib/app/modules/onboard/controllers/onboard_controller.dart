import 'package:coinbxc/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardController extends GetxController {
  final pageController = PageController();

  final currentPage = 0.obs;
  final pages = [
    {
      "image": "assets/onboard/onboard1.png",
      "title": "Secure Crypto Trading for Everyone",
      "description":
          "Trade your favorite cryptocurrencies safely and confidently with our multi-layer security, advanced encryption, and real-time monitoring to protect your assets at all times.",
    },
    {
      "image": "assets/onboard/onboard2.png",
      "title": "Fast, Instant Transactions Globally",
      "description":
          "Deposit, withdraw, and make payments instantly across the globe. Experience seamless transactions with zero delays and full transparency for all your crypto activities.",
    },
    {
      "image": "assets/onboard/onboard3.png",
      "title": "Smart Portfolio Management Anytime",
      "description":
          "Track, manage, and grow your crypto portfolio anytime, anywhere. Get insights, performance analytics, and personalized recommendations to maximize your investments.",
    },
  ];

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
}
