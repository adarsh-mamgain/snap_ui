import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

enum DividerVariant { solid, dashed, dotted }

enum DividerOrientation { horizontal, vertical }

class SnapDivider extends StatelessWidget {
  final DividerVariant variant;
  final DividerOrientation orientation;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;
  final Widget? label;
  final EdgeInsetsGeometry? labelPadding;

  const SnapDivider({
    super.key,
    this.variant = DividerVariant.solid,
    this.orientation = DividerOrientation.horizontal,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.label,
    this.labelPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);
    final effectiveColor = color ?? theme.borderColor;
    final effectiveThickness = thickness ?? 1;
    final effectiveIndent = indent ?? 0;
    final effectiveEndIndent = endIndent ?? 0;

    if (label != null) {
      return Row(
        children: [
          Expanded(
            child: _buildDivider(
              theme,
              effectiveColor,
              effectiveThickness,
              effectiveIndent,
              0,
            ),
          ),
          Padding(
            padding:
                labelPadding ??
                EdgeInsets.symmetric(horizontal: theme.spacing.three),
            child: DefaultTextStyle(
              style: theme.typography.labelMedium.copyWith(
                color: theme.textColor.withOpacity(0.6),
              ),
              child: label!,
            ),
          ),
          Expanded(
            child: _buildDivider(
              theme,
              effectiveColor,
              effectiveThickness,
              0,
              effectiveEndIndent,
            ),
          ),
        ],
      );
    }

    return _buildDivider(
      theme,
      effectiveColor,
      effectiveThickness,
      effectiveIndent,
      effectiveEndIndent,
    );
  }

  Widget _buildDivider(
    SnapUiTheme theme,
    Color color,
    double thickness,
    double indent,
    double endIndent,
  ) {
    if (orientation == DividerOrientation.vertical) {
      return VerticalDivider(
        width: _getWidth(variant, thickness),
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        color: color,
      );
    }

    return CustomPaint(
      size: Size(double.infinity, thickness),
      painter: _DividerPainter(
        color: color,
        variant: variant,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
      ),
    );
  }

  double _getWidth(DividerVariant variant, double thickness) {
    switch (variant) {
      case DividerVariant.solid:
        return thickness;
      case DividerVariant.dashed:
      case DividerVariant.dotted:
        return thickness * 2;
    }
  }
}

class _DividerPainter extends CustomPainter {
  final Color color;
  final DividerVariant variant;
  final double thickness;
  final double indent;
  final double endIndent;

  _DividerPainter({
    required this.color,
    required this.variant,
    required this.thickness,
    required this.indent,
    required this.endIndent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = thickness
          ..style = PaintingStyle.stroke;

    final startX = indent;
    final endX = size.width - endIndent;
    final y = size.height / 2;

    switch (variant) {
      case DividerVariant.solid:
        canvas.drawLine(Offset(startX, y), Offset(endX, y), paint);
        break;
      case DividerVariant.dashed:
        final dashWidth = thickness * 4;
        final dashSpace = thickness * 2;
        var currentX = startX;

        while (currentX < endX) {
          canvas.drawLine(
            Offset(currentX, y),
            Offset(currentX + dashWidth, y),
            paint,
          );
          currentX += dashWidth + dashSpace;
        }
        break;
      case DividerVariant.dotted:
        final dotRadius = thickness / 2;
        final dotSpace = thickness * 2;
        var currentX = startX;

        while (currentX < endX) {
          canvas.drawCircle(Offset(currentX, y), dotRadius, paint);
          currentX += dotSpace;
        }
        break;
    }
  }

  @override
  bool shouldRepaint(_DividerPainter oldDelegate) =>
      color != oldDelegate.color ||
      variant != oldDelegate.variant ||
      thickness != oldDelegate.thickness ||
      indent != oldDelegate.indent ||
      endIndent != oldDelegate.endIndent;
}
