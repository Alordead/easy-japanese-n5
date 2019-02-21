import 'package:flutter/material.dart';

class StandardTextContainer extends StatelessWidget {

  final String text;
  final double padding;
  final TextStyle textStyle;

  StandardTextContainer({
    @required this.text,
    this.padding = 4.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}