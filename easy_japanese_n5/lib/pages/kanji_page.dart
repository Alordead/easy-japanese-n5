import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/widgets/custom_drawer.dart';

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
    );
  }
}