import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

class SnapCard extends StatelessWidget {
  final Widget child;
  final SnapUiTheme? theme;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;

  const SnapCard({
    super.key, 
    required this.child,
    this.theme,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = theme ?? SnapUiThemeProvider.of(context);
    
    return Container(
      width: width ?? double.infinity,
      height: height,
      padding: padding ?? currentTheme.padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? currentTheme.backgroundColor,
        border: currentTheme.border,
        borderRadius: borderRadius ?? currentTheme.borderRadius,
        boxShadow: currentTheme.boxShadow,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: currentTheme.textColor,
        ),
        child: child,
      ),
    );
  }
}

/// A card with elevated appearance
class SnapElevatedCard extends SnapCard {
  SnapElevatedCard({
    super.key,
    required super.child,
    super.theme,
    super.backgroundColor,
    super.padding,
    super.borderRadius,
    super.width,
    super.height,
    List<BoxShadow>? boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = theme ?? SnapUiThemeProvider.of(context);
    
    return Container(
      width: width ?? double.infinity,
      height: height,
      padding: padding ?? currentTheme.padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? currentTheme.backgroundColor,
        border: currentTheme.border,
        borderRadius: borderRadius ?? currentTheme.borderRadius,
        boxShadow: [
          BoxShadow(
            color: currentTheme.shadowColor.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: currentTheme.textColor,
        ),
        child: child,
      ),
    );
  }
}

/// A card with no border or shadow
class SnapFlatCard extends SnapCard {
  SnapFlatCard({
    super.key,
    required super.child,
    super.theme,
    super.backgroundColor,
    super.padding,
    super.borderRadius,
    super.width,
    super.height,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = theme ?? SnapUiThemeProvider.of(context);
    
    return Container(
      width: width ?? double.infinity,
      height: height,
      padding: padding ?? currentTheme.padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? currentTheme.backgroundColor,
        borderRadius: borderRadius ?? currentTheme.borderRadius,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: currentTheme.textColor,
        ),
        child: child,
      ),
    );
  }
}
