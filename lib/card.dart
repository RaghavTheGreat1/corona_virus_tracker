import 'package:flutter/material.dart';
import 'cardText.dart';

class Card extends StatelessWidget {
  final CardText cardHeading;
  final CardText casesNumber;
  final int cardColor;
  final int borderColor;
  const Card(
      {@required this.screenWidth,
      @required this.cardHeading,
      @required this.casesNumber,
      @required this.cardColor,
      this.borderColor});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenWidth / 2.5,
      width: screenWidth / 2.5,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: cardHeading,
          ),
          Align(
            alignment: Alignment.center,
            child: casesNumber,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Color(cardColor),
        border: Border.all(
          color: Color(
            borderColor == null ? 0xFF000000 : borderColor,
          ),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

