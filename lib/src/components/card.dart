// import 'package:flutter/material.dart';
// import 'package:snap_ui/src/themes/theme.dart';

// enum SnapCardVariant { elevated, outlined, filled }

// class SnapCard extends StatelessWidget {
//   final Widget child;
//   final EdgeInsets? padding;
//   final BorderRadius? borderRadius;
//   final Color? backgroundColor;
//   final Color? color;
//   final Border? border;
//   final List<BoxShadow>? boxShadow;
//   final double? elevation;
//   final bool? usePrimaryColorForShadow;
//   final SnapCardVariant variant;
//   final VoidCallback? onTap;
//   final bool isHoverable;
//   final bool isClickable;

//   const SnapCard({
//     super.key,
//     required this.child,
//     this.padding,
//     this.borderRadius,
//     this.backgroundColor,
//     this.color,
//     this.border,
//     this.boxShadow,
//     this.elevation,
//     this.usePrimaryColorForShadow,
//     this.variant = SnapCardVariant.elevated,
//     this.onTap,
//     this.isHoverable = true,
//     this.isClickable = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = SnapUiThemeProvider.of(context);

//     // Determine card properties based on variant
//     final CardProperties properties = _getCardProperties(theme);

//     Widget card = Container(
//       padding: padding ?? theme.padding,
//       decoration: BoxDecoration(
//         color: backgroundColor ?? properties.backgroundColor,
//         borderRadius: borderRadius ?? theme.borderRadius,
//         border: border ?? properties.border,
//         boxShadow: boxShadow ?? properties.boxShadow,
//       ),
//       child: child,
//     );

//     // Add hover effect if card is hoverable
//     if (isHoverable) {
//       card = MouseRegion(
//         cursor:
//             isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
//         child: card,
//       );
//     }

//     // Add tap handler if card is clickable
//     if (isClickable && onTap != null) {
//       card = GestureDetector(onTap: onTap, child: card);
//     }

//     return card;
//   }

//   CardProperties _getCardProperties(SnapUiTheme theme) {
//     switch (variant) {
//       case SnapCardVariant.elevated:
//         return CardProperties(
//           backgroundColor: theme.backgroundColor,
//           border: null,
//           boxShadow:
//               theme
//                   .copyWith(
//                     elevation: elevation,
//                     usePrimaryColorForShadow: usePrimaryColorForShadow,
//                   )
//                   .effectiveBoxShadow,
//         );

//       case SnapCardVariant.outlined:
//         return CardProperties(
//           backgroundColor: theme.backgroundColor,
//           border: Border.all(color: theme.borderColor, width: 1),
//           boxShadow: const [],
//         );

//       case SnapCardVariant.filled:
//         return CardProperties(
//           backgroundColor: theme.primaryColor.withOpacity(0.1),
//           border: null,
//           boxShadow: const [],
//         );
//     }
//   }
// }

// class CardProperties {
//   final Color backgroundColor;
//   final Border? border;
//   final List<BoxShadow> boxShadow;

//   const CardProperties({
//     required this.backgroundColor,
//     this.border,
//     required this.boxShadow,
//   });
// }

// /// A card with elevated appearance
// class SnapElevatedCard extends SnapCard {
//   SnapElevatedCard({
//     super.key,
//     required super.child,
//     super.padding,
//     super.borderRadius,
//     super.backgroundColor,
//     super.border,
//     super.boxShadow,
//     super.elevation,
//     super.usePrimaryColorForShadow,
//     super.variant,
//     super.onTap,
//     super.isHoverable,
//     super.isClickable,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = SnapUiThemeProvider.of(context);

//     // Determine card properties based on variant
//     final CardProperties properties = _getCardProperties(theme);

//     Widget card = Container(
//       padding: padding ?? theme.padding,
//       decoration: BoxDecoration(
//         color: backgroundColor ?? properties.backgroundColor,
//         borderRadius: borderRadius ?? theme.borderRadius,
//         border: border ?? properties.border,
//         boxShadow: boxShadow ?? properties.boxShadow,
//       ),
//       child: child,
//     );

//     // Add hover effect if card is hoverable
//     if (isHoverable) {
//       card = MouseRegion(
//         cursor:
//             isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
//         child: card,
//       );
//     }

//     // Add tap handler if card is clickable
//     if (isClickable && onTap != null) {
//       card = GestureDetector(onTap: onTap, child: card);
//     }

//     return card;
//   }

//   CardProperties _getCardProperties(SnapUiTheme theme) {
//     switch (variant) {
//       case SnapCardVariant.elevated:
//         return CardProperties(
//           backgroundColor: theme.backgroundColor,
//           border: null,
//           boxShadow:
//               theme
//                   .copyWith(
//                     elevation: elevation,
//                     usePrimaryColorForShadow: usePrimaryColorForShadow,
//                   )
//                   .effectiveBoxShadow,
//         );

//       case SnapCardVariant.outlined:
//         return CardProperties(
//           backgroundColor: theme.backgroundColor,
//           border: Border.all(color: theme.borderColor, width: 1),
//           boxShadow: const [],
//         );

//       case SnapCardVariant.filled:
//         return CardProperties(
//           backgroundColor: theme.primaryColor.withOpacity(0.1),
//           border: null,
//           boxShadow: const [],
//         );
//     }
//   }
// }

// /// A card with no border or shadow
// class SnapFlatCard extends SnapCard {
//   SnapFlatCard({
//     super.key,
//     required super.child,
//     super.padding,
//     super.borderRadius,
//     super.backgroundColor,
//     super.border,
//     super.boxShadow,
//     super.elevation,
//     super.usePrimaryColorForShadow,
//     super.variant,
//     super.onTap,
//     super.isHoverable,
//     super.isClickable,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = SnapUiThemeProvider.of(context);

//     // Determine card properties based on variant
//     final CardProperties properties = _getCardProperties(theme);

//     Widget card = Container(
//       padding: padding ?? theme.padding,
//       decoration: BoxDecoration(
//         color: backgroundColor ?? properties.backgroundColor,
//         borderRadius: borderRadius ?? theme.borderRadius,
//         border: border ?? properties.border,
//         boxShadow: boxShadow ?? properties.boxShadow,
//       ),
//       child: child,
//     );

//     // Add hover effect if card is hoverable
//     if (isHoverable) {
//       card = MouseRegion(
//         cursor:
//             isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
//         child: card,
//       );
//     }

//     // Add tap handler if card is clickable
//     if (isClickable && onTap != null) {
//       card = GestureDetector(onTap: onTap, child: card);
//     }

//     return card;
//   }

//   CardProperties _getCardProperties(SnapUiTheme theme) {
//     switch (variant) {
//       case SnapCardVariant.elevated:
//         return CardProperties(
//           backgroundColor: theme.backgroundColor,
//           border: null,
//           boxShadow:
//               theme
//                   .copyWith(
//                     elevation: elevation,
//                     usePrimaryColorForShadow: usePrimaryColorForShadow,
//                   )
//                   .effectiveBoxShadow,
//         );

//       case SnapCardVariant.outlined:
//         return CardProperties(
//           backgroundColor: theme.backgroundColor,
//           border: Border.all(color: theme.borderColor, width: 1),
//           boxShadow: const [],
//         );

//       case SnapCardVariant.filled:
//         return CardProperties(
//           backgroundColor: theme.primaryColor.withOpacity(0.1),
//           border: null,
//           boxShadow: const [],
//         );
//     }
//   }
// }
