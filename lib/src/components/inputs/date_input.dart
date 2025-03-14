import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';
import 'text_input.dart';

/// A specialized text input for date selection
class SnapDateInput extends SnapTextInput {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function(DateTime?)? onDateSelected;
  final String? dateFormat;
  final bool showCalendarIcon;

  const SnapDateInput({
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
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,

    /// The format to display the date in. Supported formats:
    /// - 'dd/MM/yyyy' - 24 hour format (e.g. '23:59')
    /// - 'MM/dd/yyyy' - 12 hour format with AM/PM (e.g. '11:59 PM')
    /// - 'yyyy/MM/dd' - 12 hour format without leading zero (e.g. '9:59 AM')
    /// - 'yyyy/dd/MM' - 24 hour format with seconds (e.g. '23:59:59')
    /// - 'yyyy/MM/dd' - 12 hour format with seconds (e.g. '11:59:59 PM')
    this.dateFormat,
    this.showCalendarIcon = true,
  }) : super(
         prefix: showCalendarIcon ? const Icon(Icons.calendar_today) : null,
       );

  Future<void> _showDatePicker(BuildContext context) async {
    if (isDisabled) return;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
    );

    if (picked != null) {
      final formattedDate = _formatDate(picked);
      controller?.text = formattedDate;
      onDateSelected?.call(picked);
    }
  }

  String _formatDate(DateTime date) {
    if (dateFormat != null) {
      return dateFormat!
          .replaceAll('dd', date.day.toString().padLeft(2, '0'))
          .replaceAll('MM', date.month.toString().padLeft(2, '0'))
          .replaceAll('yyyy', date.year.toString())
          .replaceAll('yy', date.year.toString().substring(2));
    }

    return '${date.day}/${date.month}/${date.year}';
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
          onTap: () => _showDatePicker(context),
          maxLines: 1,
          showCursor: false,
          style: theme.typography.bodyMedium.copyWith(
            color:
                isDisabled ? theme.textColor.withAlpha(128) : theme.textColor,
          ),
          decoration: InputDecoration(
            hintText: hint ?? 'Select date',
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
