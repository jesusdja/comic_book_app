import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComicStyles {
  TextStyle stylePrimary({
    double size = 10,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double? heightText,
    TextDecoration? textDecoration,
    double? letterSpacing,
  }) {
    return GoogleFonts.comicNeue(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      height: heightText,
      decoration: textDecoration,
      letterSpacing: letterSpacing
    );
  }
}
