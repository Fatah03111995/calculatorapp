import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// ----------------Variable
  String equation = '0';
  String result = '0';
  String expression = '';

// fn for button
  void btnPreessed(btnTxt) {
    return setState(() {
      switch (btnTxt) {
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
          expression = expression.replaceAll('X', '*');
          expression = expression.replaceAll(':', '/');
          expression = expression.replaceAll('%', '*0.01');

          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          break;
        default:
          if (equation == '0') {
            equation = btnTxt;
            break;
          }
          equation += btnTxt;
      }
    });
  }

  //---------------CUSTOM WIDGET
  Widget btnWidget(
      {required String txt,
      Color? bgColor,
      Color? txtColor,
      double? fz,
      double? sz}) {
    return InkWell(
        onTap: () {
          btnPreessed(txt);
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          alignment: Alignment.center,
          height: 50,
          width: sz ?? 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: bgColor ?? Colors.blue[300]),
          child: Text(
            txt,
            style:
                TextStyle(color: txtColor ?? Colors.white, fontSize: fz ?? 14),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[200],
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(39, 39, 39, 1),
            title: Text('Calculator App',
                style: TextStyle(
                    color: Colors.lightBlue[200],
                    fontSize: 32,
                    fontFamily: 'Poppins'))),
        body: Column(children: [
          const SizedBox(height: 10),
          //---- DISPLAY EXPRESSION VALUE
          Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              height: 50,
              width: double.infinity,
              color: Colors.white60,
              child: Text(
                equation,
                style: TextStyle(
                  color: Colors.lightBlue[600],
                  fontSize: 20,
                ),
              )),
          //----------DISPLAY RESULT
          Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              height: 50,
              width: double.infinity,
              color: Colors.white60,
              child: Text(
                result,
                style: TextStyle(
                  color: Colors.lightBlue[600],
                  fontSize: 30,
                ),
              )),
          const SizedBox(height: 20),
          //-----------BUTTON
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    btnWidget(txt: 'AC'),
                    btnWidget(txt: 'del'),
                    btnWidget(txt: '%'),
                    btnWidget(txt: ':'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    btnWidget(
                        txt: '7',
                        bgColor: Colors.white,
                        txtColor: Colors.blue[600]),
                    btnWidget(
                        txt: '8',
                        bgColor: Colors.white,
                        txtColor: Colors.blue[600]),
                    btnWidget(
                        txt: '9',
                        bgColor: Colors.white,
                        txtColor: Colors.blue[600]),
                    btnWidget(txt: 'X'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    btnWidget(
                        txt: '4',
                        bgColor: Colors.white,
                        txtColor: Colors.blue[600]),
                    btnWidget(
                        txt: '5',
                        bgColor: Colors.white,
                        txtColor: Colors.blue[600]),
                    btnWidget(
                        txt: '6',
                        bgColor: Colors.white,
                        txtColor: Colors.blue[600]),
                    btnWidget(txt: '-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    btnWidget(
                        txt: '1',
                        bgColor: Colors.white,
                        txtColor: Colors.blue[600]),
                    btnWidget(
                        txt: '2',
                        bgColor: Colors.white,
                        txtColor: Colors.blue[600]),
                    btnWidget(
                        txt: '3',
                        bgColor: Colors.white,
                        txtColor: Colors.blue[600]),
                    btnWidget(txt: '+'),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      btnWidget(
                          txt: '0',
                          bgColor: Colors.white,
                          txtColor: Colors.blue[600],
                          sz: 100),
                      btnWidget(
                          txt: '9',
                          bgColor: Colors.white,
                          txtColor: Colors.blue[600]),
                      btnWidget(txt: '='),
                    ]),
              ],
            ),
          )
        ]));
  }
}
