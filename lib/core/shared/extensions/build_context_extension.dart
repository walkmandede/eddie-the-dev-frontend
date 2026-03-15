import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  //theme
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  //screenUtils
  double screenWidth() => MediaQuery.of(this).size.width;
  double screenHeight() => MediaQuery.of(this).size.height;
  bool isVertical() => screenHeight() > screenWidth();
}
