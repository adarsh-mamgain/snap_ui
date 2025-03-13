// import 'package:flutter/material.dart';
// import 'package:snap_ui/src/themes/theme.dart';

// enum SnapButtonVariant { filled, outlined, text, tonal }

// enum SnapButtonSize { small, medium, large }

// class SnapButton extends StatefulWidget {
//   final Widget child;
//   final VoidCallback? onPressed;
//   final SnapButtonVariant variant;
//   final SnapButtonSize size;
//   final bool isLoading;
//   final bool isFullWidth;
//   final EdgeInsets? padding;
//   final BorderRadius? borderRadius;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final bool elevated;
//   final bool usePrimaryColorForShadow;
//   final IconData? leadingIcon;
//   final IconData? trailingIcon;
//   final double? elevation;

//   const SnapButton({
//     super.key,
//     required this.child,
//     this.onPressed,
//     this.variant = SnapButtonVariant.filled,
//     this.size = SnapButtonSize.medium,
//     this.isLoading = false,
//     this.isFullWidth = false,
//     this.padding,
//     this.borderRadius,
//     this.backgroundColor,
//     this.foregroundColor,
//     this.elevated = true,
//     this.usePrimaryColorForShadow = true,
//     this.leadingIcon,
//     this.trailingIcon,
//     this.elevation,
//   });

//   @override
//   State<SnapButton> createState() => _SnapButtonState();
// }

// class _SnapButtonState extends State<SnapButton> {
//   bool _isHovered = false;
//   bool _isPressed = false;

//   @override
//   Widget build(BuildContext context) {
//     final theme = SnapUiThemeProvider.of(context);
//     final properties = _getButtonProperties(theme);

//     Widget buttonContent = Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         if (widget.leadingIcon != null) ...[
//           Icon(widget.leadingIcon, size: properties.iconSize),
//           SizedBox(width: properties.spacing),
//         ],
//         if (widget.isLoading)
//           SizedBox(
//             width: properties.loadingSize,
//             height: properties.loadingSize,
//             child: CircularProgressIndicator(
//               strokeWidth: 2,
//               valueColor: AlwaysStoppedAnimation<Color>(
//                 properties.foregroundColor,
//               ),
//             ),
//           )
//         else
//           DefaultTextStyle(
//             style: TextStyle(
//               color: properties.foregroundColor,
//               fontSize: properties.fontSize,
//               fontWeight: FontWeight.w600,
//             ),
//             child: widget.child,
//           ),
//         if (widget.trailingIcon != null) ...[
//           SizedBox(width: properties.spacing),
//           Icon(widget.trailingIcon, size: properties.iconSize),
//         ],
//       ],
//     );

//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child: GestureDetector(
//         onTapDown: (_) => setState(() => _isPressed = true),
//         onTapUp: (_) => setState(() => _isPressed = false),
//         onTapCancel: () => setState(() => _isPressed = false),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 150),
//           curve: Curves.easeInOut,
//           width: widget.isFullWidth ? double.infinity : null,
//           padding: widget.padding ?? properties.padding,
//           decoration: BoxDecoration(
//             color: _getBackgroundColor(properties),
//             borderRadius: widget.borderRadius ?? theme.borderRadius,
//             border: properties.border,
//             boxShadow:
//                 widget.elevated && !_isPressed ? _getShadow(theme) : null,
//           ),
//           child: buttonContent,
//         ),
//       ),
//     );
//   }

//   Color _getBackgroundColor(ButtonProperties properties) {
//     if (widget.onPressed == null) {
//       return properties.backgroundColor.withValues(alpha: 0.5);
//     }
//     if (_isPressed) {
//       return properties.backgroundColor.withValues(alpha: 0.8);
//     }
//     if (_isHovered) {
//       return properties.backgroundColor.withValues(alpha: 0.9);
//     }
//     return properties.backgroundColor;
//   }

//   List<BoxShadow> _getShadow(SnapUiTheme theme) {
//     return theme
//         .copyWith(
//           elevation:
//               widget.elevation ?? (widget.size == SnapButtonSize.large ? 2 : 1),
//           usePrimaryColorForShadow: widget.usePrimaryColorForShadow,
//         )
//         .effectiveBoxShadow;
//   }

//   ButtonProperties _getButtonProperties(SnapUiTheme theme) {
//     final size = widget.size;
//     final variant = widget.variant;

//     // Define size-based properties
//     final EdgeInsets padding;
//     final double fontSize;
//     final double iconSize;
//     final double spacing;
//     final double loadingSize;

//     switch (size) {
//       case SnapButtonSize.small:
//         padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
//         fontSize = 14;
//         iconSize = 16;
//         spacing = 6;
//         loadingSize = 16;
//         break;
//       case SnapButtonSize.large:
//         padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14);
//         fontSize = 16;
//         iconSize = 20;
//         spacing = 10;
//         loadingSize = 20;
//         break;
//       case SnapButtonSize.medium:
//       default:
//         padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
//         fontSize = 14;
//         iconSize = 18;
//         spacing = 8;
//         loadingSize = 18;
//         break;
//     }

//     // Define variant-based properties
//     Color backgroundColor;
//     Color foregroundColor;
//     Border? border;

//     switch (variant) {
//       case SnapButtonVariant.outlined:
//         backgroundColor = Colors.transparent;
//         foregroundColor = widget.foregroundColor ?? theme.primaryColor;
//         border = Border.all(color: theme.primaryColor);
//         break;
//       case SnapButtonVariant.text:
//         backgroundColor = Colors.transparent;
//         foregroundColor = widget.foregroundColor ?? theme.primaryColor;
//         border = null;
//         break;
//       case SnapButtonVariant.tonal:
//         backgroundColor = theme.primaryColor.withOpacity(0.1);
//         foregroundColor = widget.foregroundColor ?? theme.primaryColor;
//         border = null;
//         break;
//       case SnapButtonVariant.filled:
//         backgroundColor = widget.backgroundColor ?? theme.primaryColor;
//         foregroundColor = widget.foregroundColor ?? theme.backgroundColor;
//         border = null;
//         break;
//       default:
//         backgroundColor = widget.backgroundColor ?? theme.primaryColor;
//         foregroundColor = widget.foregroundColor ?? theme.backgroundColor;
//         border = null;
//         break;
//     }

//     return ButtonProperties(
//       padding: padding,
//       fontSize: fontSize,
//       iconSize: iconSize,
//       spacing: spacing,
//       loadingSize: loadingSize,
//       backgroundColor: backgroundColor,
//       foregroundColor: foregroundColor,
//       border: border,
//     );
//   }
// }

// class ButtonProperties {
//   final EdgeInsets padding;
//   final double fontSize;
//   final double iconSize;
//   final double spacing;
//   final double loadingSize;
//   final Color backgroundColor;
//   final Color foregroundColor;
//   final Border? border;

//   const ButtonProperties({
//     required this.padding,
//     required this.fontSize,
//     required this.iconSize,
//     required this.spacing,
//     required this.loadingSize,
//     required this.backgroundColor,
//     required this.foregroundColor,
//     this.border,
//   });
// }

// /// A button with a primary color background
// class SnapPrimaryButton extends SnapButton {
//   const SnapPrimaryButton({
//     super.key,
//     required super.child,
//     super.onPressed,
//     super.padding,
//     super.borderRadius,
//   });
// }

// /// A button with a secondary color background
// class SnapSecondaryButton extends SnapButton {
//   const SnapSecondaryButton({
//     super.key,
//     required super.child,
//     super.onPressed,
//     super.padding,
//     super.borderRadius,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SnapButton(
//       key: key,
//       onPressed: onPressed,
//       padding: padding,
//       borderRadius: borderRadius,
//       backgroundColor: SnapUiThemeProvider.of(context).secondaryColor,
//       child: child,
//     );
//   }
// }

// /// A button with no background (text only)
// class SnapTextButton extends SnapButton {
//   const SnapTextButton({
//     super.key,
//     required super.child,
//     super.onPressed,
//     super.padding,
//   }) : super(
//          backgroundColor: Colors.transparent,
//          borderRadius: BorderRadius.zero,
//        );
// }
