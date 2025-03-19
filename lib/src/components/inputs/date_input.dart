import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';
import 'text_input.dart';

/// A specialized text input component for date selection that follows SnapUI's design system.
///
/// The [SnapDateInput] widget extends [SnapTextInput] to provide a date picker interface.
/// It supports custom date formats, date range restrictions, and maintains the same
/// styling options as the base text input.
///
/// Example usage:
/// ```dart
/// SnapDateInput(
///   label: 'Birth Date',
///   initialDate: DateTime.now(),
///   firstDate: DateTime(1900),
///   lastDate: DateTime.now(),
///   dateFormat: 'dd/MM/yyyy',
///   onDateSelected: (date) {
///     // Handle date selection
///   },
/// )
/// ```
class SnapDateInput extends SnapTextInput {
  /// The initial date to show in the date picker.
  final DateTime? initialDate;

  /// The earliest date that can be selected.
  final DateTime? firstDate;

  /// The latest date that can be selected.
  final DateTime? lastDate;

  /// Callback function that is called when a date is selected.
  final void Function(DateTime?)? onDateSelected;

  /// The format to display the date in. Supported formats:
  /// * 'dd/MM/yyyy' - Day/Month/Year (e.g., '23/03/2024')
  /// * 'MM/dd/yyyy' - Month/Day/Year (e.g., '03/23/2024')
  /// * 'yyyy/MM/dd' - Year/Month/Day (e.g., '2024/03/23')
  /// * 'yyyy/dd/MM' - Year/Day/Month (e.g., '2024/23/03')
  final String? dateFormat;

  /// Whether to show a calendar icon in the input field.
  final bool showCalendarIcon;

  /// Creates a new [SnapDateInput].
  ///
  /// The [SnapDateInput] inherits most properties from [SnapTextInput] and adds
  /// date-specific functionality. The input is read-only by default and shows
  /// a date picker when tapped.
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
    this.dateFormat,
    this.showCalendarIcon = true,
  }) : super(
         prefix: showCalendarIcon ? const Icon(Icons.calendar_today) : null,
       );

  /// Shows the date picker dialog.
  ///
  /// This method is called when the input is tapped and displays a date picker
  /// with the configured date range and initial date.
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

  /// Formats the selected date according to the specified format.
  ///
  /// If no format is specified, defaults to 'dd/MM/yyyy'.
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
