import 'package:flutter/material.dart';
import 'cardText.dart';

class Card extends StatelessWidget {
  final CardText cardHeading;
  final CardText casesNumber;
  final int cardColor;
  const Card(
      {@required this.screenWidth,
      @required this.cardHeading,
      @required this.casesNumber,
      @required this.cardColor,});

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
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

