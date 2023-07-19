import 'package:comic_book_app/src/global/services/shared_preferences_static.dart';
import 'package:flutter/material.dart';

enum SplashStatus {
  splash,
  home,
  login,
}

class SplashProvider extends ChangeNotifier {

  SplashStatus splashStatus = SplashStatus.splash;

  SplashProvider() {
    initSplash();
  }

  Future initSplash() async {
    int login = SharedPreferencesLocal.comicLogin;
    if(login == 1){
      splashStatus = SplashStatus.login;
    }
    if(login == 0){
      splashStatus = SplashStatus.home;
    }
    notifyListeners();
  }
}
