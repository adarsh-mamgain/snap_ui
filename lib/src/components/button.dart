import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

class SnapButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final SnapUiTheme? theme;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  const SnapButton({
    super.key, 
    required this.child,
    this.onPressed,
    this.theme,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = theme ?? SnapUiThemeProvider.of(context);
    
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding ?? currentTheme.padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? currentTheme.primaryColor,
          border: currentTheme.border,
          borderRadius: borderRadius ?? currentTheme.borderRadius,
          boxShadow: currentTheme.boxShadow,
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          child: child,
        ),
      ),
    );
  }
}

/// A button with a primary color background
class SnapPrimaryButton extends SnapButton {
  const SnapPrimaryButton({
    super.key,
    required super.child,
    super.onPressed,
    super.theme,
    super.padding,
    super.borderRadius,
  });
}

/// A button with a secondary color background
class SnapSecondaryButton extends SnapButton {
  SnapSecondaryButton({
    super.key,
    required super.child,
    super.onPressed,
    super.theme,
    super.padding,
    super.borderRadius,
  }) : super(backgroundColor: theme?.secondaryColor);

  @override
  Widget build(BuildContext context) {
    final currentTheme = theme ?? SnapUiThemeProvider.of(context);
    
    return super.build(context);
  }
}

/// A button with no background (text only)
class SnapTextButton extends SnapButton {
  SnapTextButton({
    super.key,
    required super.child,
    super.onPressed,
    super.theme,
    super.padding,
  }) : super(
          backgroundColor: Colors.transparent,
          borderRadius: BorderRadius.zero,
        );

  @override
  Widget build(BuildContext context) {
    final currentTheme = theme ?? SnapUiThemeProvider.of(context);
    
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding ?? currentTheme.padding,
        child: DefaultTextStyle(
          style: TextStyle(
            color: currentTheme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          child: child,
        ),
      ),
    );
  }
}
