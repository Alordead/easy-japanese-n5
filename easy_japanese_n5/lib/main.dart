import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/pages/home_page.dart';
import 'package:easy_japanese_n5/helpers/themes.dart';

final ThemeData kDefaultDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,
  primarySwatch: Colors.grey,
  accentColor: Colors.blueGrey,
);

void main() => runApp(EasyJapaneseApp());

class EasyJapaneseApp extends StatelessWidget {
  final ThemeBloc themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
        initialData: themeBloc.initialTheme().data,
        stream: themeBloc.themeDataStream,
        builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
          return MaterialApp(
            title: appTitle,
            theme: snapshot.data,
            debugShowCheckedModeBanner: false,
            home: HomePage(themeBloc: themeBloc,),
          );
        });
  }
}
