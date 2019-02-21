import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/widgets/custom_drawer.dart';
import 'package:easy_japanese_n5/model/kanji_model.dart';
import 'package:easy_japanese_n5/helpers/db_provider.dart';

class KanjiPage extends StatefulWidget {
  @override
  State<KanjiPage> createState() => KanjiPageState();
}

class KanjiPageState extends State<KanjiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Кандзи"),
      ),
      drawer: CustomDrawer(),
      body: kanjiListBuilder(),
    );
  }

  Widget kanjiListBuilder() {
    return FutureBuilder<List<Kanji>>(
      future:  DBProvider.db.getAllKanjiSigns(),
      builder: (BuildContext context, AsyncSnapshot<List<Kanji>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemBuilder: (_, int index) => kanjiListViewItem(snapshot.data[index]),
            itemCount: snapshot.data.length,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  Widget kanjiListViewItem(Kanji kanji) {
    return Card(
      child: InkWell(
        onTap: () {

        },
        child: Row(
          children: <Widget>[
            Container(
              child: Text(kanji.sign, style: TextStyle(fontSize: 32.0),),
              padding: EdgeInsets.all(4.0),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(kanji.onyomi),
                  Text(kanji.kunyomi),
                ],
              ),
            ),
            Container(
              child: Text(kanji.meaning, style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center,),
              padding: EdgeInsets.all(4.0),
            ),
          ],
        ),
      ),
    );
  }
}