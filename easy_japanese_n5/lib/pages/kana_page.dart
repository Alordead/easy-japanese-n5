import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/widgets/custom_drawer.dart';

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
    );
  }
}