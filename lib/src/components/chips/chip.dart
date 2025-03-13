import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

enum ChipVariant { filled, outlined, elevated }

enum ChipSize { small, medium, large }

class SnapChip extends StatelessWidget {
  final String label;
  final Widget? leading;
  final Widget? trailing;
  final bool isSelected;
  final bool isDisabled;
  final ChipVariant variant;
  final ChipSize size;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const SnapChip({
    super.key,
    required this.label,
    this.leading,
    this.trailing,
    this.isSelected = false,
    this.isDisabled = false,
    this.variant = ChipVariant.filled,
    this.size = ChipSize.medium,
    this.onTap,
    this.onDelete,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);
    final effectiveBackgroundColor = _getBackgroundColor(theme);
    final effectiveTextColor = _getTextColor(theme);
    final effectiveBorderColor = _getBorderColor(theme);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isDisabled ? null : onTap,
        borderRadius: theme.borderRadius.full,
        child: Container(
          padding: _getPadding(theme),
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            borderRadius: theme.borderRadius.full,
            border:
                variant == ChipVariant.outlined
                    ? Border.all(color: effectiveBorderColor)
                    : null,
            boxShadow:
                variant == ChipVariant.elevated ? theme.shadows.sm : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leading != null) ...[
                leading!,
                SizedBox(width: theme.spacing.two),
              ],
              Text(
                label,
                style: theme.typography.labelMedium.copyWith(
                  color: effectiveTextColor,
                ),
              ),
              if (trailing != null) ...[
                SizedBox(width: theme.spacing.two),
                trailing!,
              ],
              if (onDelete != null) ...[
                SizedBox(width: theme.spacing.two),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: isDisabled ? null : onDelete,
                  iconSize: 16,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(SnapUiTheme theme) {
    if (backgroundColor != null) return backgroundColor!;
    if (isDisabled) return theme.disabledColor.withOpacity(0.1);
    if (isSelected) return theme.primaryColor;
    if (variant == ChipVariant.filled) {
      return theme.primaryColor.withOpacity(0.1);
    }
    return Colors.transparent;
  }

  Color _getTextColor(SnapUiTheme theme) {
    if (textColor != null) return textColor!;
    if (isDisabled) return theme.disabledColor;
    if (isSelected) return Colors.white;
    return theme.primaryColor;
  }

  Color _getBorderColor(SnapUiTheme theme) {
    if (borderColor != null) return borderColor!;
    if (isDisabled) return theme.disabledColor;
    return theme.primaryColor;
  }

  EdgeInsets _getPadding(SnapUiTheme theme) {
    switch (size) {
      case ChipSize.small:
        return EdgeInsets.symmetric(
          horizontal: theme.spacing.two,
          vertical: theme.spacing.one,
        );
      case ChipSize.medium:
        return EdgeInsets.symmetric(
          horizontal: theme.spacing.three,
          vertical: theme.spacing.two,
        );
      case ChipSize.large:
        return EdgeInsets.symmetric(
          horizontal: theme.spacing.four,
          vertical: theme.spacing.three,
        );
    }
  }
}
