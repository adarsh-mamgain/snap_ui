import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

/// A customizable button component that follows SnapUI design system.
///
/// The [SnapButton] widget provides a consistent button implementation with various
/// styles, sizes, and states. It supports loading states, disabled states, and
/// different variants (primary, secondary, outlined, text).
///
/// Example usage:
/// ```dart
/// SnapButton(
///   onPressed: () {
///     // Handle button press
///   },
///   child: Text('Click Me'),
///   variant: ButtonVariant.primary,
///   size: ButtonSize.medium,
/// )
/// ```
class SnapButton extends StatelessWidget {
  /// Callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// The widget to display inside the button.
  final Widget child;

  /// Custom button style that can override the default theme styles.
  final ButtonStyle? style;

  /// Whether the button is in a loading state.
  /// When true, displays a loading indicator instead of the child.
  final bool isLoading;

  /// Whether the button is disabled.
  /// When true, the button cannot be pressed and appears grayed out.
  final bool isDisabled;

  /// The visual style variant of the button.
  /// See [ButtonVariant] for available options.
  final ButtonVariant variant;

  /// The size of the button.
  /// See [ButtonSize] for available options.
  final ButtonSize size;

  /// Whether the button should take up the full width of its parent.
  final bool isFullWidth;

  /// Creates a new [SnapButton].
  ///
  /// The [onPressed] and [child] parameters are required.
  /// All other parameters are optional and have default values.
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

/// Defines the visual style variants available for [SnapButton].
///
/// The variants determine the button's appearance:
/// * [primary] - Main action button with solid background
/// * [secondary] - Alternative action button with different styling
/// * [outlined] - Button with transparent background and border
/// * [text] - Text-only button without background or border
enum ButtonVariant { primary, secondary, outlined, text }

/// Defines the size options available for [SnapButton].
///
/// The sizes determine the button's dimensions:
/// * [small] - Compact button for dense layouts
/// * [medium] - Standard button size
/// * [large] - Prominent button for important actions
enum ButtonSize { small, medium, large }
