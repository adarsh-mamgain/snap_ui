import 'package:flutter/material.dart';
import 'package:snap_ui/src/config/snap_constants.dart';

class SnapUiTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Color shadowColor;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final double elevation;
  final bool usePrimaryColorForShadow;

  static final lightTheme = SnapUiTheme(
    primaryColor: SnapColors.blue[500]!, // blue-500
    secondaryColor: SnapColors.blue[200]!, // blue-200
    backgroundColor: SnapColors.white,
    textColor: SnapColors.gray[900]!, // gray-900
    borderColor: SnapColors.gray[200]!, // gray-200
    shadowColor: SnapColors.gray[800]!, // gray-800
  );

  static final darkTheme = SnapUiTheme(
    primaryColor: SnapColors.blue[400]!, // blue-400
    secondaryColor: SnapColors.blue[800]!, // blue-800
    backgroundColor: SnapColors.gray[900]!, // gray-900
    textColor: SnapColors.white,
    borderColor: SnapColors.gray[700]!, // gray-700
    shadowColor: SnapColors.black,
  );

  const SnapUiTheme({
    this.primaryColor = const Color.fromRGBO(159, 174, 246, 1),
    this.secondaryColor = const Color.fromRGBO(225, 231, 255, 1),
    this.backgroundColor = Colors.white,
    this.textColor = const Color.fromRGBO(54, 54, 54, 1),
    this.borderColor = const Color.fromRGBO(237, 237, 237, 1),
    this.shadowColor = const Color.fromRGBO(71, 71, 71, 1),
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.border,
    this.boxShadow,
    this.elevation = 1,
    this.usePrimaryColorForShadow = false,
  });

  /// Creates a copy of this theme with the given fields replaced with the new values.
  SnapUiTheme copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    Color? shadowColor,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    Border? border,
    List<BoxShadow>? boxShadow,
    double? elevation,
    bool? usePrimaryColorForShadow,
  }) {
    return SnapUiTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      shadowColor: shadowColor ?? this.shadowColor,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      border: border ?? this.border,
      boxShadow: boxShadow ?? this.boxShadow,
      elevation: elevation ?? this.elevation,
      usePrimaryColorForShadow:
          usePrimaryColorForShadow ?? this.usePrimaryColorForShadow,
    );
  }

  /// Get shadow color based on configuration
  Color get effectiveShadowColor =>
      usePrimaryColorForShadow ? primaryColor : shadowColor;

  /// Get box shadow based on elevation and shadow color
  List<BoxShadow> get effectiveBoxShadow {
    if (boxShadow != null) return boxShadow!;

    final color = effectiveShadowColor;

    switch (elevation.round()) {
      case 0:
        return [];
      case 1:
        return [
          BoxShadow(
            color: color.withValues(alpha: 0.05),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ];
      case 2:
        return [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -1,
          ),
        ];
      case 3:
        return [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ];
      case 4:
        return [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            offset: const Offset(0, 20),
            blurRadius: 25,
            spreadRadius: -5,
          ),
        ];
      default:
        return [
          BoxShadow(
            color: color.withValues(alpha: 0.25),
            offset: const Offset(0, 25),
            blurRadius: 50,
            spreadRadius: -12,
          ),
        ];
    }
  }
}

/// Provider for SnapUiTheme
class SnapUiThemeProvider extends InheritedWidget {
  final SnapUiTheme theme;

  const SnapUiThemeProvider({
    super.key,
    required this.theme,
    required super.child,
  });

  static SnapUiTheme of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<SnapUiThemeProvider>();
    return provider?.theme ?? const SnapUiTheme();
  }

  @override
  bool updateShouldNotify(SnapUiThemeProvider oldWidget) =>
      theme != oldWidget.theme;
}
