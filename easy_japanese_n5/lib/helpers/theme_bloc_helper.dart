import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'shared_preferences_helper.dart';

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

  AppTheme getTheme(String appTheme) {
    String sharedAppTheme = appTheme;
    switch (sharedAppTheme) {
      case "light": return _buildLightTheme();
      case "dark": return _buildDarkTheme();
      default: return _buildInitialTheme();
    }
  }

  AppTheme setTheme(String appTheme) {
    SharedPreferencesHelper.setAppTheme(appTheme);
    switch (appTheme) {
      case "light": return _buildLightTheme();
      case "dark": return _buildDarkTheme();
      default: return _buildInitialTheme();
    }
  }

  AppTheme _buildInitialTheme() {
    return AppTheme(
        'initial',
        ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey,
          primarySwatch: Colors.grey,
        ));
  }

  AppTheme _buildDarkTheme() {
    return AppTheme(
        'dark',
        ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey,
          primarySwatch: Colors.grey,
        ));
  }

  AppTheme _buildLightTheme() {
    return AppTheme(
        'light',
        ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.redAccent,
          primaryColor: Colors.red,
        ));
  }
}
