import 'package:flutter/material.dart';

final appTitle = "Easy Japanese N5!";

final ThemeData kDefaultTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: Colors.blueGrey,
  primarySwatch: Colors.grey,
);

void main() => runApp(RoutePage());

class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: kDefaultTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Center(
          child: Text(appTitle),
        ),
      ),
    );
  }
}