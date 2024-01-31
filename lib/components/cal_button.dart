import 'package:calculatorapp_rep2/components/textsyle.dart';
import 'package:flutter/material.dart';

Widget calBtn(
    {required String value,
    required String equation,
    required String result,
    int? flex,
    double? fz,
    Color? txtColor,
    Color? bgColor,
    required void Function(String txt) fnPress}) {
  return Expanded(
      flex: flex ?? 1,
      child: InkWell(
        onTap: () {
          fnPress(value);
        },
        child: Container(
          margin: const EdgeInsets.all(2),
          alignment: Alignment.center,
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: bgColor ?? Colors.blue[600]),
          child: txtStyle(
              value: value,
              style: TextStyle(
                color: txtColor ?? Colors.white,
                fontSize: fz ?? 20,
              )),
        ),
      ));
}
