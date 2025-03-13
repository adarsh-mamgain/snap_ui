import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

class SnapAccordion extends StatefulWidget {
  final String title;
  final Widget content;
  final bool initiallyExpanded;
  final bool isDisabled;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onExpansionChanged;
  final bool showDivider;
  final bool showBorder;
  final bool showShadow;

  const SnapAccordion({
    super.key,
    required this.title,
    required this.content,
    this.initiallyExpanded = false,
    this.isDisabled = false,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.padding,
    this.contentPadding,
    this.leading,
    this.trailing,
    this.onExpansionChanged,
    this.showDivider = true,
    this.showBorder = true,
    this.showShadow = false,
  });

  @override
  State<SnapAccordion> createState() => _SnapAccordionState();
}

class _SnapAccordionState extends State<SnapAccordion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _iconTurns = _controller.drive(
      Tween<double>(
        begin: 0.0,
        end: 0.5,
      ).chain(CurveTween(curve: Curves.easeIn)),
    );
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));
    _isExpanded =
        PageStorage.of(context).readState(context) as bool? ??
        widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      PageStorage.of(context).writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);
    final effectiveBackgroundColor =
        widget.backgroundColor ?? theme.backgroundColor;
    final effectiveTextColor = widget.textColor ?? theme.textColor;
    final effectiveIconColor = widget.iconColor ?? theme.primaryColor;
    final effectivePadding =
        widget.padding ??
        EdgeInsets.symmetric(
          horizontal: theme.spacing.four,
          vertical: theme.spacing.three,
        );
    final effectiveContentPadding =
        widget.contentPadding ??
        EdgeInsets.only(
          left: theme.spacing.four,
          right: theme.spacing.four,
          bottom: theme.spacing.three,
        );

    Widget result = Container(
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: theme.borderRadius.md,
        border: widget.showBorder ? Border.all(color: theme.borderColor) : null,
        boxShadow: widget.showShadow ? theme.shadows.sm : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: widget.isDisabled ? null : _handleTap,
            child: Padding(
              padding: effectivePadding,
              child: Row(
                children: [
                  if (widget.leading != null) ...[
                    widget.leading!,
                    SizedBox(width: theme.spacing.three),
                  ],
                  Expanded(
                    child: Text(
                      widget.title,
                      style: theme.typography.titleMedium.copyWith(
                        color:
                            widget.isDisabled
                                ? theme.disabledColor
                                : effectiveTextColor,
                      ),
                    ),
                  ),
                  if (widget.trailing != null) ...[
                    SizedBox(width: theme.spacing.three),
                    widget.trailing!,
                  ],
                  SizedBox(width: theme.spacing.three),
                  RotationTransition(
                    turns: _iconTurns,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color:
                          widget.isDisabled
                              ? theme.disabledColor
                              : effectiveIconColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.showDivider && _isExpanded)
            Divider(height: 1, thickness: 1, color: theme.borderColor),
          ClipRect(
            child: AnimatedBuilder(
              animation: _controller.view,
              builder: (context, child) {
                return Align(heightFactor: _heightFactor.value, child: child);
              },
              child: Padding(
                padding: effectiveContentPadding,
                child: widget.content,
              ),
            ),
          ),
        ],
      ),
    );

    return result;
  }
}
