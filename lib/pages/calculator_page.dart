import 'package:calculatorapp_rep2/components/cal_button.dart';
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
    return setState(() {
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
    });
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
            height: 70,
            width: double.infinity,
            color: const Color.fromRGBO(255, 255, 255, 0.3),
            child: txtStyle(
                value: equation,
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 30,
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 30),
            height: 90,
            width: double.infinity,
            color: const Color.fromRGBO(255, 255, 255, 0.3),
            child: txtStyle(
                value: result,
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 50,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 30),
          // ----------------- Button for the calculator
          Row(
            children: [
              calBtn(
                  value: 'AC',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: 'del',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: '%',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: 'x',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
            ],
          ),
          Row(
            children: [
              calBtn(
                  value: '9',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: '8',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: '7',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: ':',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
            ],
          ),
          Row(
            children: [
              calBtn(
                  value: '6',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: '5',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: '4',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: '+',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
            ],
          ),
          Row(
            children: [
              calBtn(
                  value: '3',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: '2',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: '1',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: '-',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
            ],
          ),
          Row(
            children: [
              calBtn(
                  value: '0',
                  flex: 2,
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: '.',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
              calBtn(
                  value: '=',
                  equation: equation,
                  result: result,
                  fnPress: pressBtn),
            ],
          ),
        ],
      ),
    );
  }
}
