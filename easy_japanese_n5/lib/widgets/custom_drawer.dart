import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/pages/home_page.dart';
import 'package:easy_japanese_n5/helpers/themes.dart';
import 'package:easy_japanese_n5/pages/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  final ThemeBloc themeBloc;

  CustomDrawer({Key key, this.themeBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage(themeBloc: themeBloc,)),
              );
            },
            child: Container(
              height: 100.0,
              color: Theme.of(context).primaryColor.withOpacity(0.85),
              child: Center(
                child: ListTile(
                  title: Text("Домой", style: TextStyle(color: Colors.white),),
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Кана"),
            leading: CircleAvatar(
              radius: 16.0,
              child: Text("あ", style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.blue[400],
            ),
          ),
          ListTile(
            title: Text("Кандзи"),
            leading: CircleAvatar(
              radius: 16.0,
              child: Text("本", style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.green[400],
            ),
          ),
          ListTile(
            title: Text("Слова"),
            leading: CircleAvatar(
              radius: 16.0,
              child: Icon(
                Icons.library_books,
                color: Colors.white,
                size: Theme.of(context).textTheme.title.fontSize,
              ),
              backgroundColor: Colors.red[400],
            ),
          ),
          ListTile(
            title: Text("Грамматика"),
            leading: CircleAvatar(
              radius: 16.0,
              child: Icon(
                Icons.art_track,
                color: Colors.white,
                size: Theme.of(context).textTheme.title.fontSize,
              ),
              backgroundColor: Colors.purple[400],
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Настройки"),
            leading: CircleAvatar(
              radius: 16.0,
              child: Icon(
                Icons.settings,
                color: Theme.of(context).textTheme.title.color,
              ),
              backgroundColor: Colors.transparent,
            ),
            onTap:  () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingsPage(themeBloc: themeBloc,)
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}