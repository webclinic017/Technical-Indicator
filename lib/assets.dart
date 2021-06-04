import 'package:flutter/material.dart';

Color primaryColor = Color(0xFF000000);
Color textColor = Color(0xFFFFFFFF);
Color bgContainer = Color(0xFF121212);
Color indicator1 = Color(0xFF007AFF);
Color indicator2 = Color.fromRGBO(0, 122, 255, 60);
Color indicator3 = Color(0xFFFFB946);
Color indicator4 = Color.fromRGBO(255, 46, 80, 60);
Color indicator5 = Color(0xFFFF2E50);
Color nonSelected = Color(0xFF484848);

TextStyle textDesigner(
    {double size = 16,
    Color color = Colors.white,
    FontWeight weight = FontWeight.w400}) {
  return TextStyle(
      fontFamily: 'IBM', color: color, fontSize: size, fontWeight: weight);
}
