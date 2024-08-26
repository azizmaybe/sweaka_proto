import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';

class SweakaDecoration {
  final String hintText;
  final IconData? icon;
  final Color? color;

  SweakaDecoration({required this.hintText, this.icon, this.color});
  InputDecoration get textfield {
    return InputDecoration(
      prefixIcon: icon != null ? Icon(icon,
      size: 18,
      color: color ?? SweakaColors.secondaryColor,) : null,
      hintText: hintText,
      hintStyle: SweakaText.hintText1,
      contentPadding: EdgeInsets.only(left: 10),
      filled: true,
      fillColor: SweakaColors.primary_background,
      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
            color: SweakaColors.grey_scale_4, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
            color: SweakaColors.grey_scale_4, width: 2),
      ),
    );
  }
}
