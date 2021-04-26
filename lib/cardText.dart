import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardText extends StatelessWidget {
  final String data;
  final double fontSize;
  final color;
  final FontWeight fontWeight;
  const CardText(
    this.data, {
    this.fontSize = 20,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
