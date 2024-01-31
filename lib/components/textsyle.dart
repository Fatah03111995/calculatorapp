import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget txtStyle({required String value, TextStyle? style}) {
  return Text(value, style: GoogleFonts.poppins(textStyle: style));
}
