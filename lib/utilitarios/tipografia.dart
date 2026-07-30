import 'package:flutter/material.dart';

class Tipografia {
  Tipografia._();

  static TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: "Inter",
    height: 1.3,
    letterSpacing: 32 * -0.02,
  );

  static TextStyle subtitulo = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: "Inter",
    height: 1.4,
    letterSpacing: 12 * -0.01,
  );

  static TextStyle link = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: "Inter",
    height: 1.4,
    letterSpacing: 12 * -0.01,
    color: Colors.blue
  );
}
