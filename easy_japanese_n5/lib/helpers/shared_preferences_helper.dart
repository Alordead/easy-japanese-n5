import 'package:shared_preferences/shared_preferences.dart';

final List<String> _themes = ['light', 'dark'];

class SharedPreferencesHelper {

  static final String _kAppTheme = "appTheme";

  static Future<String> getAppTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String appThemePrefs = prefs.getString(_kAppTheme);
    if (appThemePrefs == null) {
      return "initial";
    }
    return appThemePrefs == "light" ? "light" : "dark";
  }

  static setAppTheme(String appTheme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kAppTheme, _themes.contains(appTheme) ? appTheme : 'dark');
  }
}