import 'package:flutter/material.dart';

import 'package:travelapp/misc/colors.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  double? width;
  Color color;
  String? text;
  bool isResponsive;
  ResponsiveButton(
      {this.color = AppColors.mainColor,
      this.width = 120,
      this.text,
      required this.isResponsive,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10),
        height: 50,
        width: width,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: const AssetImage(
              'img/button-one.png',
            ),
            alignment: isResponsive ? Alignment.centerRight : Alignment.center,
          ),
        ),
        child: isResponsive
            ? Text(
                text!.toString(),
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.start,
              )
            : null);
  }
}
