import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocal {

  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static int get comicLogin => prefs.getInt("comicLogin") ?? 0;
  static set comicLogin(int value) => prefs.setInt("comicLogin", value);
}
