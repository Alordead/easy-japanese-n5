import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/widgets/custom_drawer.dart';

class GrammarPage extends StatefulWidget {
  @override
  State<GrammarPage> createState() => GrammarPageState();
}

class GrammarPageState extends State<GrammarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Грамматика"),
      ),
      drawer: CustomDrawer(),
    );
  }
}