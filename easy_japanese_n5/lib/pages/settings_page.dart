import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/helpers/theme_switcher.dart';

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool _value;

  @override
  Widget build(BuildContext context) {
    final ThemeSwitcher inheritedThemeSwitcher = ThemeSwitcher.of(context);
    _value = Theme.of(context).brightness == Brightness.dark;
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
                value: _value,
                onChanged: (bool value) {
                  setState(() {
                    _value = value;
                    _value
                        ? inheritedThemeSwitcher.themeBloc.selectedTheme.add(inheritedThemeSwitcher.themeBloc.setTheme("dark"))
                        : inheritedThemeSwitcher.themeBloc.selectedTheme.add(inheritedThemeSwitcher.themeBloc.setTheme("light"));
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
