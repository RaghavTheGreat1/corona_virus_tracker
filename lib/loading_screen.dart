import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import '404.dart';

int confirmedCases;
int deaths;
int recovered;
int active;
bool result;
String lastUpdated;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getDataIndia() async {
    result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      Response response;
      response = await get('https://covid-19india-api.herokuapp.com/v2.0/country_data');
      List data = jsonDecode(response.body);
      confirmedCases = data[1]['confirmed_cases'];
      deaths = data[1]['death_cases'];
      recovered = data[1]['recovered_cases'];
      active = data[1]['active_cases'];
      lastUpdated = data[1]['last_updated'];
      print(confirmedCases);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            active: active,
            confirmedCases: confirmedCases,
            deaths: deaths,
            recovered: recovered,
          ),
        ),
      );
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ConnectionError()));
    }
  }

  @override
  void initState() {
    super.initState();
    getDataIndia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF202124),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Center(
                  child: Image.asset(
                    'images/virus.png',
                    scale: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Fetching Data...",
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitFadingCircle(
              color: Color(0xFFF79595),
            ),
          ],
        ));
  }
}
