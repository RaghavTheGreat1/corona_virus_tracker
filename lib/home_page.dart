import 'package:corona_virus_tracker/themes.dart';
import 'package:flutter/material.dart';
import 'cardText.dart';
import 'card.dart' as card;
import 'regional_data.dart';
import 'fetch_data.dart';
import 'themes.dart';

class HomePage extends StatefulWidget {
  final int deaths;
  final int recovered;
  final int confirmedCases;
  final int active;

  HomePage({
    this.active,
    this.confirmedCases,
    this.deaths,
    this.recovered,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

themeChanger() {
  scaffoldBGColor == themeColors["white"]
      ? scaffoldBGColor = themeColors["dark"]
      : scaffoldBGColor = themeColors["white"];
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> listOfCards = [
      Column(
        children: <Widget>[
          Container(
            height: 50,
            width: double.infinity,
            child: Center(
              child: CardText(
                '$lastUpdated',
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF010a43),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    card.Card(
                      screenWidth: screenWidth,
                      cardHeading: CardText('Confirmed'),
                      casesNumber: CardText(widget.confirmedCases.toString()),
                      cardColor: 0xFFfda403,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    card.Card(
                        screenWidth: screenWidth,
                        cardHeading: CardText(
                          "Active",
                        ),
                        casesNumber: CardText(
                          widget.active.toString(),
                        ),
                        cardColor: 0xFFf73859)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    card.Card(
                        screenWidth: screenWidth,
                        cardHeading: CardText(
                          "Recovered",
                        ),
                        casesNumber: CardText(
                          widget.recovered.toString(),
                        ),
                        cardColor: 0xFF1fab89),
                    SizedBox(
                      height: 8,
                    ),
                    card.Card(
                      screenWidth: screenWidth,
                      cardHeading: CardText(
                        "Deaths",
                      ),
                      casesNumber: CardText(
                        widget.deaths.toString(),
                      ),
                      cardColor: 0xFF233142,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      SizedBox(
        height: 25,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RegionalData();
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 50.0,
            right: 50.0,
          ),
          child: Container(
            height: 50,
            width: 50,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CardText(
                    'State-Wise Data',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFf34573),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFff0b55),
            title: CardText(
              '🇮🇳    India    🇮🇳',
              color: 0xFFfcfefe,
              fontWeight: FontWeight.w700,
            ),
            centerTitle: true,
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    themeChanger();
                  });
                  
                },
                child: Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: scaffoldBGColor,
          body: ListView(
            children: listOfCards,
          ),
        ),
      ),
    );
  }
}
