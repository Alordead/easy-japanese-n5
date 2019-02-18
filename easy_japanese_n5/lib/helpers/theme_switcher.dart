import 'package:flutter/material.dart';
import 'theme_bloc_helper.dart';

class ThemeSwitcher extends InheritedWidget {
  final ThemeBloc themeBloc;

  const ThemeSwitcher({Key key, @required Widget child, this.themeBloc})
    : super(key: key, child: child);

  static ThemeSwitcher of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ThemeSwitcher);
  }

  @override
  bool updateShouldNotify(ThemeSwitcher oldWidget) {
    return oldWidget.themeBloc != themeBloc;
  }
}