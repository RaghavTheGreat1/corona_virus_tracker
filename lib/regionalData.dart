import 'package:flutter/material.dart';
import 'cardText.dart';

class RegionalData extends StatefulWidget {
  @override
  _RegionalDataState createState() => _RegionalDataState();
}

class _RegionalDataState extends State<RegionalData> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00adb5),
        title: CardText(
          '🇮🇳    India    🇮🇳',
          color: 0xFFfcfefe,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFeeeeee),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              child: Center(
                  child: CardText(
                'West Bengal',
              )),
              decoration: BoxDecoration(
                color: Color(0xFF000000),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Color(0xFF000000),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
