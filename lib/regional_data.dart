import 'package:flutter/material.dart';
import 'cardText.dart';
import 'loading_screen.dart';

class RegionalData extends StatefulWidget {
  @override
  _RegionalDataState createState() => _RegionalDataState();
}

stateCardGenerator() {
  List<Widget> stateCardList = [];
  List<Color> colors = [
    Color(0xFFea728c),
    Color(0xFFffa41b),
    Color(0xFFff1e56),
    Color(0xFF00909e),
    Color(0xFFfe346e),
    Color(0xFF116979),
    Color(0xFFde7119),
    Color(0xFFd7385e),
    Color(0xFFf0a500),
    Color(0xFFd9455f),
    Color(0xFF6f0000),
    Color(0xFFe43f5a),
    Color(0xFFf4a548),
    Color(0xFFfa744f),
    Color(0xFFc70039),
    Color(0xFFff5722),
    Color(0xFF4d4c7d),
    Color(0xFFff1e56),
    Color(0xFF000839),
    Color(0xFFd63447),
    Color(0xFFc70039),
    Color(0xFF1eb2a6),
    Color(0xFFea728c),
    Color(0xFF111d5e),
    Color(0xFFd45079),
    Color(0xFFc70d3a),
    Color(0xFF6d3580),
    Color(0xFF018383),
    Color(0xFFe61c5d),
    Color(0xFF9a1f40),
    Color(0xFFf67280),
    Color(0xFFf0134d),
    Color(0xFFb5525c),
    Color(0xFFf57b51),
    Color(0xFF142850),
    Color(0xFFfe9801),
    Color(0xFFff9776),
    Color(0xFF018383),
    Color(0xFF21243d),
    Color(0xFFce0f3d),
    Color(0xFFfd5e53),
    Color(0xFFf0134d),
    Color(0xFFf0134d),
    
  ];
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
        backgroundColor: Color(0xFF00adb5),
        title: CardText(
          '🇮🇳    India    🇮🇳',
          color: 0xFFfcfefe,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFeeeeee),
      body: ListView(
        children: stateCardGenerator(),
      ),
    );
  }
}
