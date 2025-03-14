import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

/// A list tile component that follows SnapUI's design system
class SnapListTile extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool isInteractive;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? contentPadding;
  final bool showDivider;
  final Color? backgroundColor;

  const SnapListTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.isInteractive = true,
    this.onTap,
    this.onLongPress,
    this.contentPadding,
    this.showDivider = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);

    return Column(
      children: [
        Material(
          color: backgroundColor ?? Colors.transparent,
          child: InkWell(
            onTap: isInteractive ? onTap : null,
            onLongPress: isInteractive ? onLongPress : null,
            child: Padding(
              padding: contentPadding ?? theme.spacing.all(4),
              child: Row(
                children: [
                  if (leading != null) ...[
                    leading!,
                    SizedBox(width: theme.spacing.four),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title,
                        if (subtitle != null) ...[
                          SizedBox(height: theme.spacing.two),
                          subtitle!,
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null) ...[
                    SizedBox(width: theme.spacing.four),
                    trailing!,
                  ],
                ],
              ),
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: theme.spacing.one,
            color: theme.borderColor.withAlpha(128),
          ),
      ],
    );
  }
}
