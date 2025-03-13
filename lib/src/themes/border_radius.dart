import 'package:flutter/material.dart';

/// Border radius system for SnapUI based on Tailwind's border radius scale
class SnapThemeBorderRadius {
  final BorderRadius none;
  final BorderRadius sm;
  final BorderRadius md;
  final BorderRadius lg;
  final BorderRadius xl;
  final BorderRadius twoXl;
  final BorderRadius threeXl;
  final BorderRadius full;

  const SnapThemeBorderRadius({
    required this.none,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.twoXl,
    required this.threeXl,
    required this.full,
  });

  /// Default border radius based on Tailwind's border radius scale
  static SnapThemeBorderRadius get defaultBorderRadius {
    return SnapThemeBorderRadius(
      none: BorderRadius.zero,
      sm: const BorderRadius.all(Radius.circular(2)),
      md: const BorderRadius.all(Radius.circular(4)),
      lg: const BorderRadius.all(Radius.circular(8)),
      xl: const BorderRadius.all(Radius.circular(12)),
      twoXl: const BorderRadius.all(Radius.circular(16)),
      threeXl: const BorderRadius.all(Radius.circular(24)),
      full: const BorderRadius.all(Radius.circular(9999)),
    );
  }

  /// Get border radius for specific corners
  BorderRadius only({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0),
      topRight: Radius.circular(topRight ?? 0),
      bottomLeft: Radius.circular(bottomLeft ?? 0),
      bottomRight: Radius.circular(bottomRight ?? 0),
    );
  }
}
