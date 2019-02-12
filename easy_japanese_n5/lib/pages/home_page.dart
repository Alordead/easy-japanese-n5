import 'package:flutter/material.dart';
import 'package:easy_japanese_n5/widgets/custom_drawer.dart';

final appTitle = "Easy Japanese N5!";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text(appTitle),
      ),
    );
  }
}