import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fetch_data.dart';
import 'home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import '404.dart';


bool result;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getDataIndia() async {
    result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      await FetchData().fetchCountryData();
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
