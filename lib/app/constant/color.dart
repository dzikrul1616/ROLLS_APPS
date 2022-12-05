import 'package:flutter/material.dart';

final appPrimary = const Color(0xFF1B4A88);
final appBluesoft = Color(0xFF1DADD9);
final appYoungBlue = Color(0xFF3360AA);
final appBackground = Color(0xFFF9F9F9);
final appGrey = Color(0x4B4B4B);
final gradientPandA = LinearGradient(
  colors: [appPrimary, Colors.blue],
  begin: Alignment(-1, -1),
  end: Alignment(2, 2),
);
final gradientPandB = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xffFF3360AA), appBluesoft]);
