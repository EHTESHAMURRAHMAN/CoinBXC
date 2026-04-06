import 'package:flutter/material.dart';

class Bearish extends StatefulWidget {
  const Bearish({super.key});

  @override
  State<Bearish> createState() => _BearishState();
}

class _BearishState extends State<Bearish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("Bearish Method")
      ],),
    );
  }
}