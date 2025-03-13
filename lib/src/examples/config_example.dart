// import 'package:flutter/material.dart';
// import 'package:snap_ui/snap_ui.dart';

// class ConfigExample extends StatelessWidget {
//   const ConfigExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Initialize SnapConfig with custom values
//     SnapConfig.initialize(
//       // Use Tailwind CSS colors
//       primaryColor: SnapColors.blue[600],
//       secondaryColor: SnapColors.blue[200],
//       backgroundColor: SnapColors.gray[50],
//       textColor: SnapColors.gray[900],
//       borderColor: SnapColors.gray[200],
//       shadowColor: SnapColors.gray[900]?.withValues(alpha: 0.1),

//       // Use Tailwind CSS spacing
//       defaultPadding: const EdgeInsets.all(SnapSpacing.xl),
//       defaultMargin: const EdgeInsets.all(SnapSpacing.xl),

//       // Use Tailwind CSS border radius
//       defaultBorderRadius: SnapRadius.lg,

//       // Use Tailwind CSS shadows
//       defaultBoxShadow: SnapShadows.sm,

//       // Typography settings
//       defaultFontSize: SnapFontSizes.base,
//       defaultFontWeight: SnapFontWeights.normal,

//       // Custom values
//       customColors: {
//         'brand': SnapColors.purple[500]!,
//         'accent': SnapColors.amber[400]!,
//       },
//       customSpacing: {'button': SnapSpacing.xl2, 'card': SnapSpacing.xl4},
//       customBorderRadius: {'button': SnapRadius.full, 'card': SnapRadius.xl2},
//     );

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('SnapUI Config Example')),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(SnapSpacing.xl2),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Example using SnapCard with global config
//                 SnapCard(
//                   child: Column(
//                     children: [
//                       Text(
//                         'This card uses global config',
//                         style: TextStyle(
//                           fontSize: SnapFontSizes.xl,
//                           fontWeight: SnapFontWeights.bold,
//                         ),
//                       ),
//                       SizedBox(height: SnapSpacing.md),
//                       Text(
//                         'The styling comes from SnapConfig',
//                         style: TextStyle(color: SnapColors.gray[600]),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: SnapSpacing.xl2),

//                 // Example using custom values from config
//                 SnapCard(
//                   backgroundColor: SnapConfig.instance.getCustomColor('brand'),
//                   padding: EdgeInsets.all(
//                     SnapConfig.instance.getCustomSpacing('card') ??
//                         SnapSpacing.xl4,
//                   ),
//                   borderRadius: SnapConfig.instance.getCustomBorderRadius(
//                     'card',
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'This card uses custom values',
//                         style: TextStyle(
//                           fontSize: SnapFontSizes.xl,
//                           fontWeight: SnapFontWeights.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(height: SnapSpacing.md),
//                       Text(
//                         'Custom colors and spacing from config',
//                         style: TextStyle(
//                           color: Colors.white.withValues(
//                             alpha: SnapOpacity.opacity80,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: SnapSpacing.xl2),

//                 // Example using buttons with different styles
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SnapPrimaryButton(
//                       onPressed: () {},
//                       child: const Text('Primary'),
//                     ),
//                     SizedBox(width: SnapSpacing.md),
//                     SnapSecondaryButton(
//                       onPressed: () {},
//                       child: const Text('Secondary'),
//                     ),
//                     SizedBox(width: SnapSpacing.md),
//                     SnapTextButton(onPressed: () {}, child: const Text('Text')),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
