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
    this.dateFormat,
    this.showCalendarIcon = true,
  }) : super(
         prefix: showCalendarIcon ? const Icon(Icons.calendar_today) : null,
         onTap: () async {
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
         },
       );

  String _formatDate(DateTime date) {
    if (dateFormat != null) {
      // TODO: Implement custom date formatting
      return date.toString();
    }

    return '${date.day}/${date.month}/${date.year}';
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
          onTap: onTap,
          maxLines: 1,
          showCursor: false,
          style: theme.typography.bodyMedium.copyWith(
            color:
                isDisabled ? theme.textColor.withOpacity(0.5) : theme.textColor,
          ),
          decoration: InputDecoration(
            hintText: hint ?? 'Select date',
            hintStyle: theme.typography.bodyMedium.copyWith(
              color: theme.textColor.withOpacity(0.5),
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
                    ? theme.backgroundColor.withOpacity(0.5)
                    : variant == InputVariant.filled
                    ? theme.backgroundColor.withOpacity(0.05)
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
              color: theme.textColor.withOpacity(0.7),
            ),
          ),
        ],
      ],
    );
  }
}
