import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/pages/home_page.dart';
import 'package:easy_japanese_n5/helpers/theme_bloc_helper.dart';
import 'package:easy_japanese_n5/helpers/theme_switcher.dart';
import 'helpers/shared_preferences_helper.dart';

void main() => runApp(EasyJapaneseApp());

class EasyJapaneseApp extends StatefulWidget {
  @override
  State<EasyJapaneseApp> createState() => EasyJapaneseAppState();
}

class EasyJapaneseAppState extends State<EasyJapaneseApp> {

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = ThemeBloc();
    SharedPreferencesHelper.getAppTheme().then((String appTheme) {
      themeBloc.selectedTheme.add(themeBloc.setTheme(appTheme));
    });
    return ThemeSwitcher(
      themeBloc: themeBloc,
      child: StreamBuilder<ThemeData>(
        initialData: themeBloc.getTheme("initial").data,
        stream: themeBloc.themeDataStream,
        builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
          return MaterialApp(
            title: appTitle,
            theme: snapshot.data,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        }),
      );
  }
}