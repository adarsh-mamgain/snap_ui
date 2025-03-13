import 'package:flutter/material.dart';

/// Spacing system for SnapUI based on Tailwind's spacing scale
class SnapThemeSpacing {
  final double px;
  final double zero;
  final double one;
  final double two;
  final double three;
  final double four;
  final double five;
  final double six;
  final double eight;
  final double ten;
  final double twelve;
  final double sixteen;
  final double twenty;
  final double twentyFour;
  final double thirtyTwo;
  final double forty;
  final double fortyEight;
  final double fiftySix;
  final double sixtyFour;
  final double seventyTwo;
  final double eighty;
  final double ninetySix;

  const SnapThemeSpacing({
    required this.px,
    required this.zero,
    required this.one,
    required this.two,
    required this.three,
    required this.four,
    required this.five,
    required this.six,
    required this.eight,
    required this.ten,
    required this.twelve,
    required this.sixteen,
    required this.twenty,
    required this.twentyFour,
    required this.thirtyTwo,
    required this.forty,
    required this.fortyEight,
    required this.fiftySix,
    required this.sixtyFour,
    required this.seventyTwo,
    required this.eighty,
    required this.ninetySix,
  });

  /// Default spacing based on Tailwind's spacing scale
  static SnapThemeSpacing get defaultSpacing {
    return const SnapThemeSpacing(
      px: 1,
      zero: 0,
      one: 0.25,
      two: 0.5,
      three: 0.75,
      four: 1,
      five: 1.25,
      six: 1.5,
      eight: 2,
      ten: 2.5,
      twelve: 3,
      sixteen: 4,
      twenty: 5,
      twentyFour: 6,
      thirtyTwo: 8,
      forty: 10,
      fortyEight: 12,
      fiftySix: 14,
      sixtyFour: 16,
      seventyTwo: 18,
      eighty: 20,
      ninetySix: 24,
    );
  }

  /// Get spacing value in pixels
  double getSpacing(double value) {
    return value * 4; // Convert to pixels (1 unit = 4px)
  }

  /// Get EdgeInsets with equal spacing on all sides
  EdgeInsets all(double value) {
    final spacing = getSpacing(value);
    return EdgeInsets.all(spacing);
  }

  /// Get EdgeInsets with horizontal spacing
  EdgeInsets horizontal(double value) {
    final spacing = getSpacing(value);
    return EdgeInsets.symmetric(horizontal: spacing);
  }

  /// Get EdgeInsets with vertical spacing
  EdgeInsets vertical(double value) {
    final spacing = getSpacing(value);
    return EdgeInsets.symmetric(vertical: spacing);
  }

  /// Get EdgeInsets with top spacing
  EdgeInsets top(double value) {
    final spacing = getSpacing(value);
    return EdgeInsets.only(top: spacing);
  }

  /// Get EdgeInsets with bottom spacing
  EdgeInsets bottom(double value) {
    final spacing = getSpacing(value);
    return EdgeInsets.only(bottom: spacing);
  }

  /// Get EdgeInsets with left spacing
  EdgeInsets left(double value) {
    final spacing = getSpacing(value);
    return EdgeInsets.only(left: spacing);
  }

  /// Get EdgeInsets with right spacing
  EdgeInsets right(double value) {
    final spacing = getSpacing(value);
    return EdgeInsets.only(right: spacing);
  }
}
