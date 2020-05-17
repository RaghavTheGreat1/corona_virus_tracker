import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardText extends StatelessWidget {
  final String data;
  final int color;
  final int fontSize;
  final FontWeight fontWeight;
  const CardText(
    this.data, {
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          fontSize: fontSize == null ? 20 : fontSize,
          fontWeight: fontWeight == null ? FontWeight.w400 : fontWeight,
          color: Color(color == null ? 0xFFFFFFFF : color),
        ),
      ),
    );
  }
}
