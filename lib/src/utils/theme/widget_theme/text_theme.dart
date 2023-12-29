import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(color: Colors.black87),
    headlineMedium: GoogleFonts.poppins(color: Colors.deepPurple, fontSize: 24),
    bodySmall: GoogleFonts.poppins(
        color: Color.fromARGB(255, 42, 187, 37), fontSize: 18),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(color: Colors.white70),
    headlineMedium: GoogleFonts.poppins(color: Colors.white60, fontSize: 24),
    bodySmall: GoogleFonts.poppins(color: Colors.white60, fontSize: 18),
    bodyMedium: GoogleFonts.poppins(color: Colors.black87, fontSize: 18),
  );
}
