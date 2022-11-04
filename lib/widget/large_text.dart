// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final String? text;
  Color textColor;
  double size;
  LargeText({
    Key? key,
    required this.text,
    this.size = 25,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontSize: size, fontWeight: FontWeight.bold, color: textColor),
    );
  }
}
