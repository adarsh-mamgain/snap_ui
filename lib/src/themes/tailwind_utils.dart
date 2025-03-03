import 'package:flutter/material.dart';
import 'theme.dart';

/// A utility class to convert between Tailwind CSS class names and Flutter colors
class TailwindUtils {
  /// Convert a Tailwind CSS color class name to a Flutter color
  /// Example: 'bg-red-500' -> TailwindColors.red[500]
  static Color? colorFromTailwindClass(String className) {
    // Parse the class name
    final parts = className.split('-');
    if (parts.length < 3) {
      return null;
    }

    // Extract the color name and shade
    final colorName = parts[1];
    final shade = int.tryParse(parts[2]);
    if (shade == null) {
      return null;
    }

    // Get the color from the TailwindColors class
    switch (colorName) {
      case 'slate':
        return TailwindColors.slate[shade];
      case 'gray':
        return TailwindColors.gray[shade];
      case 'zinc':
        return TailwindColors.zinc[shade];
      case 'red':
        return TailwindColors.red[shade];
      case 'orange':
        return TailwindColors.orange[shade];
      case 'amber':
        return TailwindColors.amber[shade];
      case 'green':
        return TailwindColors.green[shade];
      case 'blue':
        return TailwindColors.blue[shade];
      case 'indigo':
        return TailwindColors.indigo[shade];
      case 'purple':
        return TailwindColors.purple[shade];
      case 'pink':
        return TailwindColors.pink[shade];
      default:
        return null;
    }
  }

  /// Convert a Tailwind CSS spacing class name to a Flutter EdgeInsets
  /// Example: 'p-4' -> EdgeInsets.all(TailwindSpacing.xl)
  static EdgeInsets? paddingFromTailwindClass(String className) {
    final parts = className.split('-');
    if (parts.length < 2) {
      return null;
    }

    final type = parts[0];
    final value = parts[1];
    
    double? spacing;
    
    // Convert the value to a TailwindSpacing value
    switch (value) {
      case 'px':
        spacing = TailwindSpacing.px;
        break;
      case '0':
        spacing = TailwindSpacing.zero;
        break;
      case '0.5':
        spacing = TailwindSpacing.xs;
        break;
      case '1':
        spacing = TailwindSpacing.sm;
        break;
      case '2':
        spacing = TailwindSpacing.md;
        break;
      case '3':
        spacing = TailwindSpacing.lg;
        break;
      case '4':
        spacing = TailwindSpacing.xl;
        break;
      case '5':
        spacing = TailwindSpacing.xl2;
        break;
      case '6':
        spacing = TailwindSpacing.xl3;
        break;
      case '8':
        spacing = TailwindSpacing.xl4;
        break;
      case '10':
        spacing = TailwindSpacing.xl5;
        break;
      case '12':
        spacing = TailwindSpacing.xl6;
        break;
      case '16':
        spacing = TailwindSpacing.xl8;
        break;
      case '20':
        spacing = TailwindSpacing.xl10;
        break;
      case '24':
        spacing = TailwindSpacing.xl12;
        break;
      case '32':
        spacing = TailwindSpacing.xl16;
        break;
      case '40':
        spacing = TailwindSpacing.xl20;
        break;
      case '48':
        spacing = TailwindSpacing.xl24;
        break;
      default:
        return null;
    }

    // Create the EdgeInsets based on the type
    switch (type) {
      case 'p':
        return EdgeInsets.all(spacing);
      case 'px':
        return EdgeInsets.symmetric(horizontal: spacing);
      case 'py':
        return EdgeInsets.symmetric(vertical: spacing);
      case 'pt':
        return EdgeInsets.only(top: spacing);
      case 'pr':
        return EdgeInsets.only(right: spacing);
      case 'pb':
        return EdgeInsets.only(bottom: spacing);
      case 'pl':
        return EdgeInsets.only(left: spacing);
      default:
        return null;
    }
  }

  /// Convert a Tailwind CSS border radius class name to a Flutter BorderRadius
  /// Example: 'rounded-lg' -> TailwindBorderRadius.lg
  static BorderRadius? borderRadiusFromTailwindClass(String className) {
    final parts = className.split('-');
    if (parts.length < 2) {
      return null;
    }

    final value = parts.length > 1 ? parts[1] : '';
    
    switch (value) {
      case '':
        return TailwindBorderRadius.md;
      case 'none':
        return TailwindBorderRadius.none;
      case 'sm':
        return TailwindBorderRadius.sm;
      case 'md':
        return TailwindBorderRadius.md;
      case 'lg':
        return TailwindBorderRadius.lg;
      case 'xl':
        return TailwindBorderRadius.xl;
      case '2xl':
        return TailwindBorderRadius.xl2;
      case '3xl':
        return TailwindBorderRadius.xl3;
      case 'full':
        return TailwindBorderRadius.full;
      default:
        return null;
    }
  }

  /// Create a theme from Tailwind CSS class names
  static SnapUiTheme themeFromTailwindClasses({
    String primaryColorClass = 'bg-blue-500',
    String secondaryColorClass = 'bg-blue-100',
    String backgroundColorClass = 'bg-gray-50',
    String textColorClass = 'text-gray-900',
    String borderColorClass = 'border-gray-200',
    String borderRadiusClass = 'rounded-lg',
    String paddingClass = 'p-4',
  }) {
    // Get the colors
    final primaryColor = colorFromTailwindClass(primaryColorClass) ?? TailwindColors.blue[500]!;
    final secondaryColor = colorFromTailwindClass(secondaryColorClass) ?? TailwindColors.blue[100]!;
    final backgroundColor = colorFromTailwindClass(backgroundColorClass) ?? TailwindColors.gray[50]!;
    final textColor = colorFromTailwindClass(textColorClass) ?? TailwindColors.gray[900]!;
    final borderColor = colorFromTailwindClass(borderColorClass) ?? TailwindColors.gray[200]!;
    
    // Get the border radius
    final borderRadius = borderRadiusFromTailwindClass(borderRadiusClass) ?? TailwindBorderRadius.lg;
    
    // Get the padding
    final padding = paddingFromTailwindClass(paddingClass) ?? const EdgeInsets.all(TailwindSpacing.xl);
    
    // Create the theme
    return SnapUiTheme.custom(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      borderColor: borderColor,
      borderRadius: borderRadius,
      padding: padding,
    );
  }
} 