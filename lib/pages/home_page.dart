import 'package:calculatorapp_rep2/components/textsyle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: txtStyle(
            value: 'Calculator App',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: Center(
        child: Column(children: [
          const Text('''Welcome to this application
          this is use to calculate the number,
          includes multiply, divide, minus, plus, and percent'''),
          const SizedBox(height: 30),
          ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/calculator');
              },
              child: txtStyle(
                  value: 'Click Here to The App',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)))
        ]),
      ),
    );
  }
}
