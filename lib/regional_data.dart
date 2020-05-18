import 'package:flutter/material.dart';
import 'cardText.dart';
import 'loading_screen.dart';
import 'themes.dart';

class RegionalData extends StatefulWidget {
  @override
  _RegionalDataState createState() => _RegionalDataState();
}

stateCardGenerator() {
  List<Widget> stateCardList = [];
  
  for (int i = 0; i < fetchedStateData.length; i++) {
    stateCardList.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          child: Center(
              child: CardText(
            fetchedStateData[i]['state'],
          )),
          decoration: BoxDecoration(
            color: colors[i],
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
    stateCardList.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          width: screenWidth,
          decoration: BoxDecoration(
            color: colors[i],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CardText('Conirmed: '),
                      CardText(fetchedStateData[i]['confirmed']),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CardText('Active: '),
                      CardText(fetchedStateData[i]['active']),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CardText('Recovered: '),
                      CardText(fetchedStateData[i]['recovered']),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      CardText('Deaths: '),
                      CardText(fetchedStateData[i]['deaths']),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  return stateCardList;
}

class _RegionalDataState extends State<RegionalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Color(0xFFff0b55),
        title: CardText(
          '🇮🇳    India    🇮🇳',
          color: 0xFFfcfefe,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      backgroundColor: scaffoldBGColor,
      body: ListView(
        children: stateCardGenerator(),
      ),
    );
  }
}
