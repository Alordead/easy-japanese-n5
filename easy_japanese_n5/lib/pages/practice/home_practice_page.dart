import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/widgets/custom_drawer.dart';

class HomePracticePage extends StatefulWidget {
  @override
  State<HomePracticePage> createState() => HomePracticePageState();
}

class HomePracticePageState extends State<HomePracticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Практика"),
      ),
      drawer: CustomDrawer(),
    );
  }
}