import 'package:flutter/material.dart';
import 'Screens/InsiderPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InsiderPage(),
    );
  }
}
