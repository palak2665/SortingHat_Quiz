import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Color(0xff7622B6)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        primaryColor: const Color(0xff131217).withOpacity(0.9),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.islandMoments().fontFamily,
          ),
          bodyText1: const TextStyle(
            color: Colors.white,
            fontSize: 17.0,
          ),
          headline2: const TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
          headline3: const TextStyle(
            color: Colors.black,
            fontSize: 17.0,
          ),
        ),
      );
}
