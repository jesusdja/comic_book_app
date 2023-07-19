import 'package:comic_book_app/initial_page.dart';
import 'package:comic_book_app/src/global/config/comic_colors.dart';
import 'package:comic_book_app/src/global/widgets_utils/circular_progress_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ComicColors.color_cbd5f3,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          circularProgressColors(
            colorCircular: ComicColors.primary,
            widthContainer1: sizeW,
            widthContainer2: sizeW * 0.1
          ),
        ],
      ),
    );
  }
}
