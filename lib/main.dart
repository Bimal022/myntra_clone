import 'package:flutter/material.dart';
import 'Screens/InsiderPage.dart';
import 'Screens/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/insider': (context) => InsiderPage(),
      },
    );
  }
}
