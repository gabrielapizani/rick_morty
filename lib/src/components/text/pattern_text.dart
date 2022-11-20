import 'package:flutter/material.dart';

class PatternText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight;

  const PatternText({
    required this.text,
    required this.color,
    required this.fontSize,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      softWrap: true,
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
