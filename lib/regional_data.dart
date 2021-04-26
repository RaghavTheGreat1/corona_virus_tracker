import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 150,
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CardText(
                      fetchedStateData[i]['state'],
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CardText(
                          'Confirmed: ',
                          fontWeight: FontWeight.w600,
                        ),
                        CardText(
                          fetchedStateData[i]['confirmed'],
                          color: Colors.deepOrangeAccent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CardText(
                          'Active: ',
                          fontWeight: FontWeight.w600,
                        ),
                        CardText(
                          fetchedStateData[i]['active'],
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CardText(
                          'Recovered: ',
                          fontWeight: FontWeight.w600,
                        ),
                        CardText(
                          fetchedStateData[i]['recovered'],
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CardText(
                          'Deaths: ',
                          fontWeight: FontWeight.w600,
                        ),
                        CardText(
                          fetchedStateData[i]['deaths'],
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
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
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Statewise Data",
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
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
