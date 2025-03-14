import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';
import 'text_input.dart';

/// A specialized text input for time selection
class SnapTimeInput extends SnapTextInput {
  final TimeOfDay? initialTime;
  final void Function(TimeOfDay?)? onTimeSelected;

  /// The format to display the time in. Supported formats:
  /// - 'HH:mm' - 24 hour format (e.g. '23:59')
  /// - 'hh:mm a' - 12 hour format with AM/PM (e.g. '11:59 PM')
  /// - 'h:mm a' - 12 hour format without leading zero (e.g. '9:59 AM')
  /// - 'HH:mm:ss' - 24 hour format with seconds (e.g. '23:59:59')
  /// - 'hh:mm:ss a' - 12 hour format with seconds (e.g. '11:59:59 PM')
  final String? timeFormat;
  final bool showClockIcon;

  const SnapTimeInput({
    super.key,
    super.controller,
    super.label,
    super.hint,
    super.error,
    super.helper,
    super.isDisabled = false,
    super.isReadOnly = true,
    super.isRequired = false,
    super.variant = InputVariant.outlined,
    super.size = InputSize.medium,
    this.initialTime,
    this.onTimeSelected,
    this.timeFormat,
    this.showClockIcon = true,
  }) : super(prefix: showClockIcon ? const Icon(Icons.access_time) : null);

  Future<void> _showTimePicker(BuildContext context) async {
    if (isDisabled) return;

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );

    if (picked != null && context.mounted) {
      final formattedTime = _formatTime(picked, context);
      controller?.text = formattedTime;
      onTimeSelected?.call(picked);
    }
  }

  String _formatTime(TimeOfDay time, BuildContext context) {
    if (timeFormat != null) {
      final hour = time.hour.toString().padLeft(2, '0');
      final minute = time.minute.toString().padLeft(2, '0');
      final period = time.period == DayPeriod.am ? 'AM' : 'PM';

      return timeFormat!
          .replaceAll('HH', hour)
          .replaceAll('mm', minute)
          .replaceAll('a', period);
    }

    return time.format(context);
  }

  EdgeInsets _getContentPadding() {
    switch (size) {
      case InputSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case InputSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case InputSize.large:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 16);
    }
  }

  OutlineInputBorder _getBorder(
    SnapUiTheme theme, {
    bool isFocused = false,
    bool isError = false,
  }) {
    final color =
        isError
            ? Colors.red
            : isFocused
            ? theme.primaryColor
            : theme.borderColor;

    return OutlineInputBorder(
      borderRadius: theme.borderRadius.md,
      borderSide: BorderSide(color: color, width: isFocused ? 2 : 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label! + (isRequired ? ' *' : ''),
            style: theme.typography.labelMedium.copyWith(
              color: error != null ? Colors.red : theme.textColor,
            ),
          ),
          SizedBox(height: theme.spacing.two),
        ],
        TextField(
          controller: controller,
          enabled: !isDisabled,
          readOnly: isReadOnly,
          keyboardType: TextInputType.none,
          textInputAction: TextInputAction.done,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onTap: () => _showTimePicker(context),
          maxLines: 1,
          showCursor: false,
          style: theme.typography.bodyMedium.copyWith(
            color:
                isDisabled ? theme.textColor.withAlpha(128) : theme.textColor,
          ),
          decoration: InputDecoration(
            hintText: hint ?? 'Select time',
            hintStyle: theme.typography.bodyMedium.copyWith(
              color: theme.textColor.withAlpha(128),
            ),
            prefixIcon: prefix,
            suffixIcon: suffix,
            isDense: size == InputSize.small,
            contentPadding: _getContentPadding(),
            border: _getBorder(theme),
            enabledBorder: _getBorder(theme),
            focusedBorder: _getBorder(theme, isFocused: true),
            errorBorder: _getBorder(theme, isError: true),
            focusedErrorBorder: _getBorder(
              theme,
              isError: true,
              isFocused: true,
            ),
            filled: variant == InputVariant.filled,
            fillColor:
                isDisabled
                    ? theme.backgroundColor.withAlpha(128)
                    : variant == InputVariant.filled
                    ? theme.backgroundColor.withAlpha(13)
                    : null,
            counterText: '',
          ),
        ),
        if (error != null) ...[
          SizedBox(height: theme.spacing.two),
          Text(
            error!,
            style: theme.typography.labelSmall.copyWith(color: Colors.red),
          ),
        ],
        if (helper != null && error == null) ...[
          SizedBox(height: theme.spacing.two),
          Text(
            helper!,
            style: theme.typography.labelSmall.copyWith(
              color: theme.textColor.withAlpha(128),
            ),
          ),
        ],
      ],
    );
  }
}
