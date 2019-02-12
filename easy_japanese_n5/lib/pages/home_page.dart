import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/widgets/custom_drawer.dart';
import 'package:easy_japanese_n5/helpers/themes.dart';
import 'settings_page.dart';

final appTitle = "Easy Japanese N5!";

class HomePage extends StatelessWidget {
  final ThemeBloc themeBloc;

  HomePage({Key key, this.themeBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage(themeBloc: themeBloc,)),
            );
          },
          ),
        ],
     ),
      drawer: CustomDrawer(themeBloc: themeBloc,),
      body: Center(
        child: Text(appTitle),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Test",
        child: Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 35.0,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {

        }
        ),
    );
  }
}