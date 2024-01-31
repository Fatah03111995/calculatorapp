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
    return Scaffold();
  }
}
