import 'package:flutter/material.dart';

class Bullish extends StatefulWidget {
  const Bullish({super.key});

  @override
  State<Bullish> createState() => _BullishState();
}

class _BullishState extends State<Bullish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Bullish")));
  }
}
