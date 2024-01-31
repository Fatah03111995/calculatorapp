import 'package:calculatorapp_rep2/components/textsyle.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = '';
  String result = '0';
  String equation = '0';

  void pressBtn(String txt) {
    String expression;

    switch (txt) {
      case 'AC':
        equation = '0';
        result = '0';
        break;
      case 'del':
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') equation = '0';
        break;
      case '=':
        expression = equation;
        expression = expression
            .replaceAll('x', '*')
            .replaceAll(':', '/')
            .replaceAll('%', '*0.01');

        Parser p = Parser();
        Expression exp = p.parse(expression);
        result = '${exp.evaluate(EvaluationType.REAL, ContextModel())}';
        break;
      default:
        if (equation == '0') {
          equation = txt;
          break;
        }
        equation += txt;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
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
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 30),
            height: 50,
            width: double.infinity,
            color: const Color.fromRGBO(255, 255, 255, 0.3),
            child: txtStyle(
                value: equation,
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 24,
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 30),
            height: 70,
            width: double.infinity,
            color: const Color.fromRGBO(255, 255, 255, 0.3),
            child: txtStyle(
                value: result,
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 32,
                    fontWeight: FontWeight.w600)),
          ),
          // Button
        ],
      ),
    );
  }
}
