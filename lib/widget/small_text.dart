import 'package:flutter/material.dart';
import 'package:travelapp/misc/colors.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final String? text;
  Color textColor;
  double size;
  SmallText({
    Key? key,
    required this.text,
    this.size = 16,
    this.textColor = AppColors.textColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(fontSize: size, color: textColor),
    );
  }
}
