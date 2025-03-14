import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

/// A card component that follows SnapUI's design system
class SnapCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final bool isInteractive;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const SnapCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.isInteractive = false,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);

    return Container(
      margin: margin ?? theme.spacing.all(4),
      child: Material(
        color: backgroundColor ?? theme.backgroundColor,
        borderRadius: borderRadius ?? theme.borderRadius.lg,
        elevation: elevation ?? theme.shadows.sm[0].blurRadius / 4,
        shadowColor: theme.shadows.sm[0].color,
        child: InkWell(
          onTap: isInteractive ? onTap : null,
          onLongPress: isInteractive ? onLongPress : null,
          borderRadius: borderRadius ?? theme.borderRadius.lg,
          child: Container(
            padding: padding ?? theme.spacing.all(6),
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? theme.borderRadius.lg,
              border: Border.all(
                color: theme.borderColor.withAlpha(128),
                width: 1,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
