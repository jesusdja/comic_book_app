import 'package:comic_book_app/src/global/config/comic_colors.dart';
import 'package:flutter/material.dart';

Widget circularProgressColors({
  double widthContainer1 = 50,
  double widthContainer2 = 50,
  Color colorCircular = ComicColors.primary,
}){
  return SizedBox(
    width: widthContainer1,
    child: Center(
      child: SizedBox(
        height: widthContainer2, width: widthContainer2,
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(colorCircular)),
      ),
    ),
  );
}