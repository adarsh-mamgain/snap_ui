import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

enum BadgeVariant { filled, outlined, dot }

enum BadgeColor { primary, success, warning, error, info }

class SnapBadge extends StatelessWidget {
  final String? label;
  final BadgeVariant variant;
  final BadgeColor color;
  final Widget? child;
  final bool showBadge;
  final int? count;
  final double? size;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const SnapBadge({
    super.key,
    this.label,
    this.variant = BadgeVariant.filled,
    this.color = BadgeColor.primary,
    this.child,
    this.showBadge = true,
    this.count,
    this.size,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  }) : assert(
         (label != null) || (child != null),
         'Either label or child must be provided',
       );

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);
    final effectiveBackgroundColor = _getBackgroundColor(theme);
    final effectiveTextColor = _getTextColor(theme);
    final effectiveBorderColor = _getBorderColor(theme);

    if (variant == BadgeVariant.dot) {
      return Stack(
        children: [
          if (child != null) child!,
          if (showBadge)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: size ?? theme.spacing.three,
                height: size ?? theme.spacing.three,
                decoration: BoxDecoration(
                  color: effectiveBackgroundColor,
                  shape: BoxShape.circle,
                  border:
                      variant == BadgeVariant.outlined
                          ? Border.all(color: effectiveBorderColor)
                          : null,
                ),
              ),
            ),
        ],
      );
    }

    if (child != null) {
      return Stack(
        children: [
          child!,
          if (showBadge)
            Positioned(
              right: -theme.spacing.one,
              top: -theme.spacing.one,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.spacing.two,
                  vertical: theme.spacing.one,
                ),
                decoration: BoxDecoration(
                  color: effectiveBackgroundColor,
                  borderRadius: theme.borderRadius.full,
                  border:
                      variant == BadgeVariant.outlined
                          ? Border.all(color: effectiveBorderColor)
                          : null,
                ),
                child: Text(
                  count?.toString() ?? label!,
                  style: theme.typography.labelSmall.copyWith(
                    color: effectiveTextColor,
                  ),
                ),
              ),
            ),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.two,
        vertical: theme.spacing.one,
      ),
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: theme.borderRadius.full,
        border:
            variant == BadgeVariant.outlined
                ? Border.all(color: effectiveBorderColor)
                : null,
      ),
      child: Text(
        label!,
        style: theme.typography.labelSmall.copyWith(color: effectiveTextColor),
      ),
    );
  }

  Color _getBackgroundColor(SnapUiTheme theme) {
    if (backgroundColor != null) return backgroundColor!;
    switch (color) {
      case BadgeColor.primary:
        return theme.primaryColor;
      case BadgeColor.success:
        return theme.successColor;
      case BadgeColor.warning:
        return theme.warningColor;
      case BadgeColor.error:
        return theme.errorColor;
      case BadgeColor.info:
        return theme.infoColor;
    }
  }

  Color _getTextColor(SnapUiTheme theme) {
    if (textColor != null) return textColor!;
    if (variant == BadgeVariant.outlined) {
      return _getBackgroundColor(theme);
    }
    return Colors.white;
  }

  Color _getBorderColor(SnapUiTheme theme) {
    if (borderColor != null) return borderColor!;
    return _getBackgroundColor(theme);
  }
}
