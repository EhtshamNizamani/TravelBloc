// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travelapp/misc/colors.dart';

class AppButton extends StatelessWidget {
  AppButton({Key? key, required this.index, required this.isIcon})
      : super(key: key);
  int index;
  bool isIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border:
            isIcon ? Border.all(width: 1, color: AppColors.textColor2) : null,
        borderRadius: BorderRadius.circular(10),
        color: isIcon ? Colors.white : Colors.grey.shade300,
      ),
      child: isIcon
          ? const Icon(
              Icons.favorite_border,
              color: AppColors.textColor2,
            )
          : Center(
              child: Text(
                "  ${index + 1}",
              ),
            ),
    );
  }
}
