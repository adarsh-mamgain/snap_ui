import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

/// Base button component for SnapUI
class SnapButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;
  final bool isLoading;
  final bool isDisabled;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool isFullWidth;

  const SnapButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.isLoading = false,
    this.isDisabled = false,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);
    final effectiveStyle = _getButtonStyle(theme);

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: (isDisabled || isLoading) ? null : onPressed,
        style: effectiveStyle,
        child: _buildButtonChild(),
      ),
    );
  }

  Widget _buildButtonChild() {
    if (isLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    return child;
  }

  ButtonStyle _getButtonStyle(SnapUiTheme theme) {
    final baseStyle = ButtonStyle(
      padding: WidgetStateProperty.all(_getPadding()),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: theme.borderRadius.md),
      ),
      elevation: WidgetStateProperty.all(0),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return theme.primaryColor.withAlpha(128);
        }
        return _getBackgroundColor(theme);
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.white.withAlpha(128);
        }
        return _getForegroundColor(theme);
      }),
    );

    return style?.copyWith(
          padding: baseStyle.padding,
          shape: baseStyle.shape,
          elevation: baseStyle.elevation,
          backgroundColor: baseStyle.backgroundColor,
          foregroundColor: baseStyle.foregroundColor,
        ) ??
        baseStyle;
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
    }
  }

  Color _getBackgroundColor(SnapUiTheme theme) {
    switch (variant) {
      case ButtonVariant.primary:
        return theme.primaryColor;
      case ButtonVariant.secondary:
        return theme.secondaryColor;
      case ButtonVariant.outlined:
        return Colors.transparent;
      case ButtonVariant.text:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor(SnapUiTheme theme) {
    switch (variant) {
      case ButtonVariant.primary:
        return Colors.white;
      case ButtonVariant.secondary:
        return theme.primaryColor;
      case ButtonVariant.outlined:
        return theme.primaryColor;
      case ButtonVariant.text:
        return theme.primaryColor;
    }
  }
}

/// Button variants for SnapUI
enum ButtonVariant { primary, secondary, outlined, text }

/// Button sizes for SnapUI
enum ButtonSize { small, medium, large }
