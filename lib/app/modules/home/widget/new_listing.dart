import 'package:flutter/material.dart';

class NewListing extends StatefulWidget {
  const NewListing({super.key});

  @override
  State<NewListing> createState() => _NewListingState();
}

class _NewListingState extends State<NewListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("New Listing")));
  }
}
