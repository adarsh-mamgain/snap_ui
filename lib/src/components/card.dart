import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snap_ui/src/themes/theme.dart';

class SnapCard extends StatelessWidget {
  final Widget child;
  final SnapUiTheme theme = SnapUiTheme.lightTheme;

  SnapCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: theme.padding,
      decoration: BoxDecoration(
        color: theme.secondaryColor,
        border: theme.border,
        borderRadius: theme.borderRadius,
        boxShadow: theme.boxShadow,
      ),
      child: child,
    );
  }
}
