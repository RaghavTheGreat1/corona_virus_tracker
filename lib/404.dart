import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loading_screen.dart';

class ConnectionError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEFF5F3),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/404.jpg'),
            Text(
              "You're offline!",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (LoadingScreen()),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Retry",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
