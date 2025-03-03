import 'package:flutter/material.dart';
import 'package:snap_ui/src/config/snap_constants.dart';

/// Global configuration for SnapUI components
class SnapConfig {
  /// Singleton instance of SnapConfig
  static SnapConfig? _instance;

  /// Get the current instance of SnapConfig
  static SnapConfig get instance {
    if (_instance == null) {
      throw Exception(
        'SnapConfig has not been initialized. Please call SnapConfig.initialize() before using SnapUI components.',
      );
    }
    return _instance!;
  }

  /// Initialize SnapConfig with custom values
  static void initialize({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    Color? shadowColor,
    EdgeInsets? defaultPadding,
    EdgeInsets? defaultMargin,
    BorderRadius? defaultBorderRadius,
    Border? defaultBorder,
    List<BoxShadow>? defaultBoxShadow,
    double? defaultBorderWidth,
    double? defaultFontSize,
    FontWeight? defaultFontWeight,
    String? fontFamily,
    Map<String, Color>? customColors,
    Map<String, double>? customSpacing,
    Map<String, BorderRadius>? customBorderRadius,
    bool isDarkMode = false,
  }) {
    _instance = SnapConfig._(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      borderColor: borderColor,
      shadowColor: shadowColor,
      defaultPadding: defaultPadding,
      defaultMargin: defaultMargin,
      defaultBorderRadius: defaultBorderRadius,
      defaultBorder: defaultBorder,
      defaultBoxShadow: defaultBoxShadow,
      defaultBorderWidth: defaultBorderWidth,
      defaultFontSize: defaultFontSize,
      defaultFontWeight: defaultFontWeight,
      fontFamily: fontFamily,
      customColors: customColors,
      customSpacing: customSpacing,
      customBorderRadius: customBorderRadius,
      isDarkMode: isDarkMode,
    );
  }

  /// Reset the configuration to default values
  static void reset() {
    _instance = SnapConfig._();
  }

  // Core colors
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Color shadowColor;

  // Default values
  final EdgeInsets defaultPadding;
  final EdgeInsets defaultMargin;
  final BorderRadius defaultBorderRadius;
  final Border defaultBorder;
  final List<BoxShadow> defaultBoxShadow;
  final double defaultBorderWidth;
  final double defaultFontSize;
  final FontWeight defaultFontWeight;
  final String? fontFamily;

  // Custom values
  final Map<String, Color> customColors;
  final Map<String, double> customSpacing;
  final Map<String, BorderRadius> customBorderRadius;

  // Theme mode
  final bool isDarkMode;

  SnapConfig._({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    Color? shadowColor,
    EdgeInsets? defaultPadding,
    EdgeInsets? defaultMargin,
    BorderRadius? defaultBorderRadius,
    Border? defaultBorder,
    List<BoxShadow>? defaultBoxShadow,
    double? defaultBorderWidth,
    double? defaultFontSize,
    FontWeight? defaultFontWeight,
    this.fontFamily,
    Map<String, Color>? customColors,
    Map<String, double>? customSpacing,
    Map<String, BorderRadius>? customBorderRadius,
    bool? isDarkMode,
  }) : primaryColor = primaryColor ?? SnapColors.blue[500]!, // blue-500
       secondaryColor = secondaryColor ?? SnapColors.blue[200]!, // blue-200
       backgroundColor = backgroundColor ?? SnapColors.gray[50]!, // gray-50
       textColor = textColor ?? SnapColors.gray[900]!, // gray-900
       borderColor = borderColor ?? SnapColors.gray[200]!, // gray-200
       shadowColor =
           shadowColor ?? SnapColors.gray[800]!.withOpacity(0.1), // gray-800
       defaultPadding = defaultPadding ?? const EdgeInsets.all(16),
       defaultMargin = defaultMargin ?? const EdgeInsets.all(16),
       defaultBorderRadius = defaultBorderRadius ?? BorderRadius.circular(8),
       defaultBorder =
           defaultBorder ?? Border.all(color: SnapColors.gray[200]!),
       defaultBoxShadow =
           defaultBoxShadow ??
           [
             BoxShadow(
               color: SnapColors.gray[800]!.withOpacity(0.05),
               offset: const Offset(0, 1),
               blurRadius: 2,
               spreadRadius: 0,
             ),
           ],
       defaultBorderWidth = defaultBorderWidth ?? 1,
       defaultFontSize = defaultFontSize ?? 14,
       defaultFontWeight = defaultFontWeight ?? FontWeight.normal,
       customColors = customColors ?? const {},
       customSpacing = customSpacing ?? const {},
       customBorderRadius = customBorderRadius ?? const {},
       isDarkMode = isDarkMode ?? false;

  /// Get a custom color by name
  Color? getCustomColor(String name) => customColors[name];

  /// Get a custom spacing value by name
  double? getCustomSpacing(String name) => customSpacing[name];

  /// Get a custom border radius by name
  BorderRadius? getCustomBorderRadius(String name) => customBorderRadius[name];

  /// Create a copy of the current configuration with some values updated
  SnapConfig copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    Color? shadowColor,
    EdgeInsets? defaultPadding,
    EdgeInsets? defaultMargin,
    BorderRadius? defaultBorderRadius,
    Border? defaultBorder,
    List<BoxShadow>? defaultBoxShadow,
    double? defaultBorderWidth,
    double? defaultFontSize,
    FontWeight? defaultFontWeight,
    String? fontFamily,
    Map<String, Color>? customColors,
    Map<String, double>? customSpacing,
    Map<String, BorderRadius>? customBorderRadius,
    bool? isDarkMode,
  }) {
    _instance = SnapConfig._(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      shadowColor: shadowColor ?? this.shadowColor,
      defaultPadding: defaultPadding ?? this.defaultPadding,
      defaultMargin: defaultMargin ?? this.defaultMargin,
      defaultBorderRadius: defaultBorderRadius ?? this.defaultBorderRadius,
      defaultBorder: defaultBorder ?? this.defaultBorder,
      defaultBoxShadow: defaultBoxShadow ?? this.defaultBoxShadow,
      defaultBorderWidth: defaultBorderWidth ?? this.defaultBorderWidth,
      defaultFontSize: defaultFontSize ?? this.defaultFontSize,
      defaultFontWeight: defaultFontWeight ?? this.defaultFontWeight,
      fontFamily: fontFamily ?? this.fontFamily,
      customColors: customColors ?? this.customColors,
      customSpacing: customSpacing ?? this.customSpacing,
      customBorderRadius: customBorderRadius ?? this.customBorderRadius,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
    return _instance!;
  }
}
