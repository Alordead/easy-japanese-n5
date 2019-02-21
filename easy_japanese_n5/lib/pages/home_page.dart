import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/widgets/custom_drawer.dart';
import 'settings_page.dart';
import 'practice/home_practice_page.dart';
import 'package:easy_japanese_n5/widgets/text_widgets.dart';

final appTitle = "Easy Japanese N5!";

class HomePage extends StatelessWidget {

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
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
          ),
        ],
     ),
      drawer: CustomDrawer(),
      body: Center(
        child: HomePageContent(),
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
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePracticePage(),)
          );
        }
        ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StandardTextContainer(text:
            "Привет, это Easy Japanese N5 - твой кратчайший путь к успешному освоению японского языка!",
            ),
            StandardTextContainer(text:
            "Вместе мы изучим азбуку, основную грамматику, словарь и иероглифы."
            ),
            StandardTextContainer(text:
            "Вперед к приключениям!",
              textStyle: Theme.of(context).textTheme.body2,
            ),
          ],
        ),
      ),
    );
  }
}