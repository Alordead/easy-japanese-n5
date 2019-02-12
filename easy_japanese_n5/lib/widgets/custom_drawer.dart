import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            color: Colors.black45,
            child: Center(
              child: ListTile(
                title: Text("Домой"),
                leading: Icon(Icons.home),
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
                color: Colors.white,
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}