import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoneyThemeData {
  ThemeData themeData = ThemeData(
    primaryColor: const Color(0xFF2743FB),
    textTheme: GoogleFonts.montserratTextTheme(),
  );

  ThemeData getThemeData() {
    return themeData;
  }
}
