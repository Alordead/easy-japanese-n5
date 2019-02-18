import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/widgets/custom_drawer.dart';
import 'package:easy_japanese_n5/model/kana_model.dart';
import 'package:easy_japanese_n5/helpers/db_provider.dart';

class KanaPage extends StatefulWidget {
  @override
  State<KanaPage> createState() => KanaPageState();
}

class KanaPageState extends State<KanaPage> {

  bool isTapped;

  @override
  void initState() {
    isTapped = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Кана"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Хирагана",),
              Tab(text: "Катакана",)
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: isTapped ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
              onPressed: () {
               setState(() {
                 isTapped = !isTapped;
               });
              },
            ),
          ],
        ),
        drawer: CustomDrawer(),
        body: TabBarView(
          children: <Widget>[
            hiraganaTabBarView(),
            katakanaTabBarView()
          ],
        ),
      ),
    );
  }

  Widget hiraganaTabBarView() {
    return FutureBuilder<List<Kana>>(
      future: DBProvider.db.getAllKanaSigns("hiragana"),
      builder: (BuildContext context, AsyncSnapshot<List<Kana>> snapshot) {
        return tabBarView(snapshot);
      }
    );
  }

  Widget katakanaTabBarView() {
    return FutureBuilder<List<Kana>>(
      future: DBProvider.db.getAllKanaSigns("katakana"),
      builder: (BuildContext context, AsyncSnapshot<List<Kana>> snapshot) {
        return tabBarView(snapshot);
      },
    );
  }

  Widget tabBarView(AsyncSnapshot<List<Kana>> snapshot) {
    if (snapshot.hasData) {
      return GridView.builder(
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemCount: snapshot.data.length,
          itemBuilder: (context, position) {
            return snapshot.data[position].sign != "" ? Card(
              child: InkWell(
                onTap: () {
                  
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    isTapped ? Container(child: Text(snapshot.data[position].sign, style: TextStyle(fontSize: 32.0),),)
                    : Column(children: <Widget>[
                    Text(snapshot.data[position].sign, style: TextStyle(fontSize: 32.0),),
                    Text(snapshot.data[position].reading),
                    ],),
                  ],
                ),
              ),
            ) : Container();
          }
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}