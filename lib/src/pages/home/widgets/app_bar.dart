import 'package:comic_book_app/initial_page.dart';
import 'package:comic_book_app/src/global/config/comic_colors.dart';
import 'package:comic_book_app/src/global/config/comic_style.dart';
import 'package:flutter/material.dart';

AppBar appBarHome(){
  return AppBar(
    backgroundColor: Colors.white,
    title: Text('Comic Book App',style: ComicStyles().stylePrimary(
      size: sizeH * 0.03,color: ComicColors.primary,fontWeight: FontWeight.bold
    )),
    centerTitle: true,
  );
}