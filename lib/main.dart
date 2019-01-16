import 'package:flutter/material.dart';
import 'package:grocery_list/groceries.dart';

void main() => runApp(MyApp());

/// Application class.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Groceries(), // Set the home route.
      debugShowCheckedModeBanner: false, // Disable debug banner.
    );
  }
}
