import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/helpers/themes.dart';

class SettingsPage extends StatefulWidget {
  final ThemeBloc themeBloc;

  SettingsPage({Key key, this.themeBloc}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool _enabled;

  @override
  Widget build(BuildContext context) {
    _enabled = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text("Настройки"),
      ),
      body: Container(
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Темная тема"),
              Switch(
                value: _enabled,
                onChanged: (bool value) {
                  setState(() {
                    _enabled = value;
                    _enabled
                        ? widget.themeBloc.selectedTheme.add(_buildDarkTheme())
                        : widget.themeBloc.selectedTheme
                            .add(_buildLightTheme());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
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
