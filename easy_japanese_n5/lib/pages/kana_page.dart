import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/widgets/custom_drawer.dart';
import 'package:easy_japanese_n5/model/kana_model.dart';
import 'package:easy_japanese_n5/helpers/db_provider.dart';

class KanaPage extends StatefulWidget {
  @override
  State<KanaPage> createState() => KanaPageState();
}

class KanaPageState extends State<KanaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Кана"),
      ),
      drawer: CustomDrawer(),
      body: FutureBuilder<List<Kana>>(
        future: DBProvider.db.getAllSigns(),
        builder: (BuildContext context, AsyncSnapshot<List<Kana>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                itemCount: snapshot.data.length,
                itemBuilder: (context, position) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(snapshot.data[position].sign, style: TextStyle(fontSize: 32.0),),
                        Text(snapshot.data[position].reading),
                      ],
                    )
                  );
                }
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}