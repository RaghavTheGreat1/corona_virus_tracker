import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardText extends StatelessWidget {
  final String data;
  final int color;
  final double fontSize;
  final FontWeight fontWeight;
  const CardText(
    this.data, {
    this.color = 0xFFFFFFFF,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Color(color),
        ),
      ),
    );
  }
}
