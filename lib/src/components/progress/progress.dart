import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

enum ProgressVariant { linear, circular, indeterminate }

enum ProgressSize { xs, sm, md, lg, xl }

class SnapProgress extends StatelessWidget {
  final double? value;
  final ProgressVariant variant;
  final ProgressSize size;
  final Color? color;
  final Color? backgroundColor;
  final double? strokeWidth;
  final bool showLabel;
  final String? label;
  final bool isIndeterminate;

  const SnapProgress({
    super.key,
    this.value,
    this.variant = ProgressVariant.linear,
    this.size = ProgressSize.md,
    this.color,
    this.backgroundColor,
    this.strokeWidth,
    this.showLabel = false,
    this.label,
    this.isIndeterminate = false,
  }) : assert(
         (value != null && value >= 0 && value <= 1) || isIndeterminate,
         'Value must be between 0 and 1, or isIndeterminate must be true',
       );

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);
    final effectiveColor = color ?? theme.primaryColor;
    final effectiveBackgroundColor =
        backgroundColor ?? theme.primaryColor.withValues(alpha: 128);
    final effectiveStrokeWidth = _getStrokeWidth(theme);
    final effectiveSize = _getSize(theme);

    Widget progress;
    switch (variant) {
      case ProgressVariant.linear:
        progress = _buildLinearProgress(
          theme,
          effectiveColor,
          effectiveBackgroundColor,
          effectiveStrokeWidth,
        );
        break;
      case ProgressVariant.circular:
        progress = _buildCircularProgress(
          theme,
          effectiveColor,
          effectiveBackgroundColor,
          effectiveStrokeWidth,
          effectiveSize,
        );
        break;
      case ProgressVariant.indeterminate:
        progress = _buildIndeterminateProgress(
          theme,
          effectiveColor,
          effectiveBackgroundColor,
          effectiveStrokeWidth,
          effectiveSize,
        );
        break;
    }

    if (showLabel) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          progress,
          SizedBox(height: theme.spacing.two),
          Text(
            label ?? '${(value ?? 0) * 100}%',
            style: theme.typography.labelMedium,
          ),
        ],
      );
    }

    return progress;
  }

  Widget _buildLinearProgress(
    SnapUiTheme theme,
    Color color,
    Color backgroundColor,
    double strokeWidth,
  ) {
    return ClipRRect(
      borderRadius: theme.borderRadius.full,
      child: LinearProgressIndicator(
        value: isIndeterminate ? null : value,
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        minHeight: strokeWidth,
      ),
    );
  }

  Widget _buildCircularProgress(
    SnapUiTheme theme,
    Color color,
    Color backgroundColor,
    double strokeWidth,
    double size,
  ) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        value: isIndeterminate ? null : value,
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        strokeWidth: strokeWidth,
      ),
    );
  }

  Widget _buildIndeterminateProgress(
    SnapUiTheme theme,
    Color color,
    Color backgroundColor,
    double strokeWidth,
    double size,
  ) {
    if (variant == ProgressVariant.linear) {
      return LinearProgressIndicator(
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        minHeight: strokeWidth,
      );
    } else {
      return CircularProgressIndicator(
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        strokeWidth: strokeWidth,
      );
    }
  }

  double _getStrokeWidth(SnapUiTheme theme) {
    if (strokeWidth != null) return strokeWidth!;
    switch (size) {
      case ProgressSize.xs:
        return theme.spacing.one;
      case ProgressSize.sm:
        return theme.spacing.two;
      case ProgressSize.md:
        return theme.spacing.three;
      case ProgressSize.lg:
        return theme.spacing.four;
      case ProgressSize.xl:
        return theme.spacing.six;
    }
  }

  double _getSize(SnapUiTheme theme) {
    switch (size) {
      case ProgressSize.xs:
        return theme.spacing.six;
      case ProgressSize.sm:
        return theme.spacing.eight;
      case ProgressSize.md:
        return theme.spacing.twelve;
      case ProgressSize.lg:
        return theme.spacing.sixteen;
      case ProgressSize.xl:
        return theme.spacing.twentyFour;
    }
  }
}
