import 'package:corona_virus_tracker/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF202124),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Text(
                    "India",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: screenWidth / 2.5,
                        width: screenWidth / 2.5,
                        child: Column(
                          children: <Widget>[
                            CardText(
                              'CONFIRMED CASES',
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            CardText(
                              confirmedCases.toString(),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF08599D),
                          border: Border.all(
                            color: Color(0xFF000000),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: screenWidth / 2.5,
                        width: screenWidth / 2.5,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Active Cases",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              widget.active.toString(),
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFD21F3C),
                          border: Border.all(
                            color: Color(0xFF000000),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: screenWidth / 2.5,
                        width: screenWidth / 2.5,
                        child: Column(
                          children: <Widget>[
                            CardText("Recovered"),
                            SizedBox(
                              height: 30,
                            ),
                            CardText(
                              widget.recovered.toString(),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF24BFA5),
                          border: Border.all(
                            color: Color(0xFF000000),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: screenWidth / 2.5,
                        width: screenWidth / 2.5,
                        child: Column(
                          children: <Widget>[
                            CardText(
                              "Deaths",
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            CardText(
                              widget.deaths.toString(),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF1D1D1D),
                          border: Border.all(
                            color: Color(0xFF000000),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
