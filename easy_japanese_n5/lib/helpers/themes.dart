import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class AppTheme {
  final String name;
  final ThemeData data;

  const AppTheme(this.name, this.data);
}

class ThemeBloc {
  final Stream<ThemeData> themeDataStream;
  final Sink<AppTheme> selectedTheme;

  factory ThemeBloc() {
    final selectedTheme = PublishSubject<AppTheme>();
    final themeDataStream = selectedTheme.distinct().map((theme) => theme.data);
    return ThemeBloc._(themeDataStream, selectedTheme);
  }

  const ThemeBloc._(this.themeDataStream, this.selectedTheme);

  AppTheme initialTheme() {
    return AppTheme(
        'initial',
        ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey,
          primarySwatch: Colors.grey,
        ));
  }
}
