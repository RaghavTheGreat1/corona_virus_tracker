import 'package:corona_virus_tracker/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                color: Colors.white,
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
                      cardHeading: CardText(
                        'Confirmed',
                        color: Colors.white,
                      ),
                      casesNumber: CardText(
                        widget.confirmedCases.toString(),
                        color: Colors.white,
                      ),
                      cardColor: 0xFFfda403,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    card.Card(
                        screenWidth: screenWidth,
                        cardHeading: CardText(
                          "Active",
                          color: Colors.white,
                        ),
                        casesNumber: CardText(
                          widget.active.toString(),
                          color: Colors.white,
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
                          color: Colors.white,
                        ),
                        casesNumber: CardText(
                          widget.recovered.toString(),
                          color: Colors.white,
                        ),
                        cardColor: 0xFF1fab89),
                    SizedBox(
                      height: 8,
                    ),
                    card.Card(
                      screenWidth: screenWidth,
                      cardHeading: CardText(
                        "Deaths",
                        color: Colors.white,
                      ),
                      casesNumber: CardText(
                        widget.deaths.toString(),
                        color: Colors.white,
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
                    color: Colors.white,
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
    Future<bool> _onBackPressed() {
      return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                new GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Text("NO"),
                ),
                SizedBox(height: 16),
                new GestureDetector(
                  onTap: () => Navigator.of(context).pop(true),
                  child: Text("YES"),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Coronavirus Tracker",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
            ),
            backgroundColor: scaffoldBGColor,
            body: ListView(
              children: listOfCards,
            ),
          ),
        ),
      ),
    );
  }
}
