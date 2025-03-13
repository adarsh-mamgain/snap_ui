import 'package:flutter/material.dart';
import 'package:snap_ui/src/config/snap_constants.dart';
import 'package:snap_ui/src/themes/typography.dart';
import 'package:snap_ui/src/themes/spacing.dart';
import 'package:snap_ui/src/themes/border_radius.dart';
import 'package:snap_ui/src/themes/shadows.dart';

/// Main theme class for SnapUI
class SnapUiTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Color shadowColor;
  final SnapThemeTypography typography;
  final SnapThemeSpacing spacing;
  final SnapThemeBorderRadius borderRadius;
  final SnapThemeShadows shadows;
  final bool usePrimaryColorForShadow;

  static final lightTheme = SnapUiTheme(
    primaryColor: SnapColors.blue[500]!,
    secondaryColor: SnapColors.blue[200]!,
    backgroundColor: SnapColors.white,
    textColor: SnapColors.gray[900]!,
    borderColor: SnapColors.gray[200]!,
    shadowColor: SnapColors.gray[800]!,
    typography: SnapThemeTypography.defaultTypography,
    spacing: SnapThemeSpacing.defaultSpacing,
    borderRadius: SnapThemeBorderRadius.defaultBorderRadius,
    shadows: SnapThemeShadows.defaultShadows,
  );

  static final darkTheme = SnapUiTheme(
    primaryColor: SnapColors.blue[400]!,
    secondaryColor: SnapColors.blue[800]!,
    backgroundColor: SnapColors.gray[900]!,
    textColor: SnapColors.white,
    borderColor: SnapColors.gray[700]!,
    shadowColor: SnapColors.black,
    typography: SnapThemeTypography.defaultTypography,
    spacing: SnapThemeSpacing.defaultSpacing,
    borderRadius: SnapThemeBorderRadius.defaultBorderRadius,
    shadows: SnapThemeShadows.defaultShadows,
  );

  const SnapUiTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.shadowColor,
    required this.typography,
    required this.spacing,
    required this.borderRadius,
    required this.shadows,
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
    SnapThemeTypography? typography,
    SnapThemeSpacing? spacing,
    SnapThemeBorderRadius? borderRadius,
    SnapThemeShadows? shadows,
    bool? usePrimaryColorForShadow,
  }) {
    return SnapUiTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      shadowColor: shadowColor ?? this.shadowColor,
      typography: typography ?? this.typography,
      spacing: spacing ?? this.spacing,
      borderRadius: borderRadius ?? this.borderRadius,
      shadows: shadows ?? this.shadows,
      usePrimaryColorForShadow:
          usePrimaryColorForShadow ?? this.usePrimaryColorForShadow,
    );
  }

  /// Get shadow color based on configuration
  Color get effectiveShadowColor =>
      usePrimaryColorForShadow ? primaryColor : shadowColor;
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
    return provider?.theme ??
        SnapUiTheme(
          primaryColor: Colors.blue,
          secondaryColor: Colors.blueAccent,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          borderColor: Colors.grey,
          shadowColor: Colors.black,
          typography: SnapThemeTypography.defaultTypography,
          spacing: SnapThemeSpacing.defaultSpacing,
          borderRadius: SnapThemeBorderRadius.defaultBorderRadius,
          shadows: SnapThemeShadows.defaultShadows,
        );
  }

  @override
  bool updateShouldNotify(SnapUiThemeProvider oldWidget) =>
      theme != oldWidget.theme;
}
