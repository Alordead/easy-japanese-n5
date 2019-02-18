import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/widgets/custom_drawer.dart';

class WordsPage extends StatefulWidget {
  @override
  State<WordsPage> createState() => WordsPageState();
}

class WordsPageState extends State<WordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Слова"),
      ),
      drawer: CustomDrawer(),
    );
  }
}