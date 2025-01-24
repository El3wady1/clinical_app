import 'package:flutter/material.dart';

class WidgetsStyles {
  static var AppbarStylee = Container(
      decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.pink.shade900,
        Colors.blue.withOpacity(0.8),
      ], // Adjust colors as needed
    ),
  ));
  static var buttonhomestyle = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.deepPurple.shade900,
        Colors.white.withOpacity(0.1),
      ]);
  static var buttonhomescolor = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.amber.shade900,
        Colors.yellow.withOpacity(0.8),
      ]);
  static var drawr = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.deepPurple.shade900,
        Colors.deepPurple.withOpacity(0.8),
      ]);
}
