import 'package:flutter/material.dart';
import 'cardText.dart';
import 'card.dart' as card;

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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: CardText('India'),
            centerTitle: true,
          ),
          backgroundColor: Color(0xFF202124),
          body: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                          cardHeading: CardText('Confirmed Cases'),
                          casesNumber:
                              CardText(widget.confirmedCases.toString()),
                          cardColor: 0xFF0E385D,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        card.Card(
                            screenWidth: screenWidth,
                            cardHeading: CardText(
                              "Active Cases",
                            ),
                            casesNumber: CardText(
                              widget.active.toString(),
                            ),
                            cardColor: 0xFFD21F3C)
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
                            cardColor: 0xFF24BFA5),
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
                          cardColor: 0xFF1D1D1D,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
