import 'package:flutter/material.dart';

class CustomColors {
  static Color primary = HexColor("#ffffff");
  static Color white = HexColor("#ffffff");

  static Color black = HexColor("#000000");
  static Color black10 = HexColor("#161616");

  static Color grey = HexColor("#0d2C3B8B");
  static Color gray30 = HexColor("#ecebef");
  static Color gray50 = HexColor("#00000029");
  static Color gray70 = HexColor("#A4A4A4");
  static Color gray80 = HexColor("#707070");
  static Color gray90 = HexColor("#bfbec2");
  static Color gray100 = HexColor("#40404026");
  static Color gray150 = HexColor("#373735");

  static Color purple = HexColor("#5B4DA7");
  static Color purple50 = HexColor("#a199cd");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
