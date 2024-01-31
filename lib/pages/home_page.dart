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
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            width: 300,
            child: Center(
              child: Text(
                'Welcome to this application this is use to calculate the number, includes multiply, divide, minus, plus, and percent',
                textAlign: TextAlign.center,
              ),
            ),
          ),
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
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)))
        ]),
      ),
    );
  }
}
