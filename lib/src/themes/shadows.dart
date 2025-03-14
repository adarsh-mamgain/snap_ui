import 'package:flutter/material.dart';

/// Shadow system for SnapUI based on Tailwind's shadow scale
class SnapThemeShadows {
  final List<BoxShadow> none;
  final List<BoxShadow> sm;
  final List<BoxShadow> md;
  final List<BoxShadow> lg;
  final List<BoxShadow> xl;
  final List<BoxShadow> twoXl;
  final List<BoxShadow> inner;

  const SnapThemeShadows({
    required this.none,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.twoXl,
    required this.inner,
  });

  /// Default shadows based on Tailwind's shadow scale
  static SnapThemeShadows get defaultShadows {
    return SnapThemeShadows(
      none: const [],
      sm: [
        BoxShadow(
          color: Colors.black.withAlpha(128),
          offset: const Offset(0, 1),
          blurRadius: 2,
        ),
      ],
      md: [
        BoxShadow(
          color: Colors.black.withAlpha(128),
          offset: const Offset(0, 4),
          blurRadius: 6,
          spreadRadius: -1,
        ),
      ],
      lg: [
        BoxShadow(
          color: Colors.black.withAlpha(128),
          offset: const Offset(0, 10),
          blurRadius: 15,
          spreadRadius: -3,
        ),
      ],
      xl: [
        BoxShadow(
          color: Colors.black.withAlpha(128),
          offset: const Offset(0, 20),
          blurRadius: 25,
          spreadRadius: -5,
        ),
      ],
      twoXl: [
        BoxShadow(
          color: Colors.black.withAlpha(128),
          offset: const Offset(0, 25),
          blurRadius: 50,
          spreadRadius: -12,
        ),
      ],
      inner: [
        BoxShadow(
          color: Colors.black.withAlpha(128),
          offset: const Offset(0, 2),
          blurRadius: 4,
          spreadRadius: -1,
        ),
      ],
    );
  }

  /// Get shadow with custom color
  List<BoxShadow> withColor(Color color) {
    return [
      BoxShadow(
        color: color.withAlpha(128),
        offset: const Offset(0, 4),
        blurRadius: 6,
        spreadRadius: -1,
      ),
    ];
  }

  /// Get shadow with custom opacity
  List<BoxShadow> withOpacity(double opacity) {
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: opacity),
        offset: const Offset(0, 4),
        blurRadius: 6,
        spreadRadius: -1,
      ),
    ];
  }
}
