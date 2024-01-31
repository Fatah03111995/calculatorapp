import 'package:calculatorapp_rep2/pages/calculator_page.dart';
import 'package:calculatorapp_rep2/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/calculator': (context) => Calculator(),
      },
    );
  }
}
