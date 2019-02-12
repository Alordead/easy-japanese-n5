import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/pages/home_page.dart';

final ThemeData kDefaultTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,
  primarySwatch: Colors.grey,
);

void main() => runApp(EasyJapaneseApp());

class EasyJapaneseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: kDefaultTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}