import 'package:flutter/material.dart';

class Tranding extends StatefulWidget {
  const Tranding({super.key});

  @override
  State<Tranding> createState() => _TrandingState();
}

class _TrandingState extends State<Tranding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Trandinig"),),
    );
  }
}