import 'package:flutter/material.dart';

class SnapUiTheme {
  final Color primaryColor;
  final Color secondaryColor;

  SnapUiTheme({required this.primaryColor, required this.secondaryColor});

  static SnapUiTheme lightTheme = SnapUiTheme(
    primaryColor: Colors.blue,
    secondaryColor: Colors.white,
  );

  static SnapUiTheme darkTheme = SnapUiTheme(
    primaryColor: Colors.black,
    secondaryColor: Colors.grey,
  );

  /// Padding
  final EdgeInsets padding = EdgeInsets.all(16.0);

  /// Margin
  final EdgeInsets margin = EdgeInsets.all(16.0);

  /// Border
  final BorderRadius borderRadius = BorderRadius.circular(16.0);
  final Color borderColor = Color.fromARGB(92, 92, 92, 92);
  Border get border => Border.all(color: borderColor);

  /// Shadow
  final Color shadowColor = Color.fromARGB(92, 92, 92, 92).withAlpha(36);
  // Adjusted to match the HSL color
  late final List<BoxShadow> boxShadow = [
    BoxShadow(
      color: shadowColor,
      offset: Offset(0.3, 0.5),
      blurRadius: 0.7,
      spreadRadius: 0.3,
    ),
    BoxShadow(
      color: shadowColor,
      offset: Offset(0.8, 1.6),
      blurRadius: 2.0,
      spreadRadius: -0.8,
    ),
    BoxShadow(
      color: shadowColor,
      offset: Offset(2.1, 4.1),
      blurRadius: 5.2,
      spreadRadius: -1.7,
    ),
    BoxShadow(
      color: shadowColor,
      offset: Offset(5.0, 10.0),
      blurRadius: 12.6,
      spreadRadius: -2.5,
    ),
  ];
}
