import 'package:calculatorapp_rep2/components/textsyle.dart';
import 'package:flutter/material.dart';

Widget calBtn(
    {required String value,
    required String equation,
    required String result,
    double? fz,
    double wz = 50,
    Color? txtColor,
    Color? bgColor,
    required void Function(String txt) fnPress}) {
  return ElevatedButton(
    onPressed: () {
      fnPress;
    },
    style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(bgColor ?? Colors.blue[600]),
        minimumSize: MaterialStatePropertyAll(Size(wz, 50)),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))),
    child: Container(
      child: txtStyle(
          value: value,
          style: TextStyle(
            color: txtColor ?? Colors.white,
            fontSize: fz ?? 14,
          )),
    ),
  );
}
