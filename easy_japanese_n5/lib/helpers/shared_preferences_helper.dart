import 'package:shared_preferences/shared_preferences.dart';

final List<String> _themes = ['light', 'dark'];

class SharedPreferencesHelper {

  static final String _kAppTheme = "appTheme";

  static Future<String> getAppTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(_kAppTheme) ?? 'initial';
  }

  static Future<bool> setAppTheme(String appTheme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kAppTheme, appTheme);
  }
}