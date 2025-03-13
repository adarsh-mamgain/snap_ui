import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

enum TooltipPosition { top, bottom, left, right }

enum TooltipVariant { light, dark, colored }

class SnapTooltip extends StatelessWidget {
  final Widget child;
  final String message;
  final TooltipPosition position;
  final TooltipVariant variant;
  final bool showArrow;
  final Duration? showDuration;
  final Duration? waitDuration;
  final bool preferBelow;
  final bool enableFeedback;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final bool? isRich;
  final TextStyle? richMessage;

  const SnapTooltip({
    super.key,
    required this.child,
    required this.message,
    this.position = TooltipPosition.top,
    this.variant = TooltipVariant.dark,
    this.showArrow = true,
    this.showDuration,
    this.waitDuration,
    this.preferBelow = false,
    this.enableFeedback = true,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.height,
    this.isRich = false,
    this.richMessage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);
    final effectiveBackgroundColor = _getBackgroundColor(theme);
    final effectiveTextColor = _getTextColor(theme);
    final effectivePadding =
        padding ??
        EdgeInsets.symmetric(
          horizontal: theme.spacing.three,
          vertical: theme.spacing.two,
        );

    return Tooltip(
      message: message,
      preferBelow: _getPreferBelow(),
      height: height,
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: theme.borderRadius.md,
      ),
      textStyle:
          (isRich! && richMessage != null)
              ? richMessage
              : theme.typography.labelSmall.copyWith(color: effectiveTextColor),
      showDuration: showDuration ?? const Duration(seconds: 2),
      waitDuration: waitDuration ?? const Duration(milliseconds: 0),
      enableFeedback: enableFeedback,
      child: child,
    );
  }

  bool _getPreferBelow() {
    switch (position) {
      case TooltipPosition.top:
        return false;
      case TooltipPosition.bottom:
        return true;
      case TooltipPosition.left:
      case TooltipPosition.right:
        return preferBelow;
    }
  }

  Color _getBackgroundColor(SnapUiTheme theme) {
    if (backgroundColor != null) return backgroundColor!;
    switch (variant) {
      case TooltipVariant.light:
        return Colors.white;
      case TooltipVariant.dark:
        return Colors.black87;
      case TooltipVariant.colored:
        return theme.primaryColor;
    }
  }

  Color _getTextColor(SnapUiTheme theme) {
    if (textColor != null) return textColor!;
    switch (variant) {
      case TooltipVariant.light:
        return Colors.black87;
      case TooltipVariant.dark:
      case TooltipVariant.colored:
        return Colors.white;
    }
  }
}
