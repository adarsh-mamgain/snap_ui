import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

/// A dialog component that follows SnapUI's design system
class SnapDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? contentPadding;
  final bool showCloseButton;
  final VoidCallback? onClose;

  const SnapDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
    this.contentPadding,
    this.showCloseButton = true,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: theme.borderRadius.lg),
      child: Container(
        padding: contentPadding ?? theme.spacing.all(6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: title),
                if (showCloseButton)
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: onClose ?? () => Navigator.of(context).pop(),
                  ),
              ],
            ),
            SizedBox(height: theme.spacing.four),
            content,
            if (actions != null) ...[
              SizedBox(height: theme.spacing.six),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: actions!),
            ],
          ],
        ),
      ),
    );
  }
}
