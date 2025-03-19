import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

/// A customizable card component that follows SnapUI's design system.
///
/// The [SnapCard] widget provides a consistent card implementation with various
/// styling options and interactive states. It supports custom padding, margins,
/// elevation, and border radius, while maintaining the SnapUI design language.
///
/// Example usage:
/// ```dart
/// SnapCard(
///   child: Column(
///     children: [
///       Text('Card Title'),
///       Text('Card Content'),
///     ],
///   ),
///   isInteractive: true,
///   onTap: () {
///     // Handle card tap
///   },
/// )
/// ```
class SnapCard extends StatelessWidget {
  /// The widget to display inside the card.
  final Widget child;

  /// The padding to apply to the card's content.
  /// If null, uses the theme's default spacing.
  final EdgeInsetsGeometry? padding;

  /// The margin to apply around the card.
  /// If null, uses the theme's default spacing.
  final EdgeInsetsGeometry? margin;

  /// The background color of the card.
  /// If null, uses the theme's background color.
  final Color? backgroundColor;

  /// The elevation (shadow) of the card.
  /// If null, uses the theme's default shadow.
  final double? elevation;

  /// The border radius of the card.
  /// If null, uses the theme's default border radius.
  final BorderRadius? borderRadius;

  /// Whether the card should be interactive (tappable).
  /// When true, enables onTap and onLongPress callbacks.
  final bool isInteractive;

  /// Callback function that is called when the card is tapped.
  /// Only works when [isInteractive] is true.
  final VoidCallback? onTap;

  /// Callback function that is called when the card is long-pressed.
  /// Only works when [isInteractive] is true.
  final VoidCallback? onLongPress;

  /// Creates a new [SnapCard].
  ///
  /// The [child] parameter is required.
  /// All other parameters are optional and have default values.
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
