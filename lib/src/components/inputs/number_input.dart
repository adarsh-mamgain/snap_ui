import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';
import 'text_input.dart';

/// A specialized text input for numeric values
class SnapNumberInput extends SnapTextInput {
  final double? min;
  final double? max;
  final double? step;
  final bool allowNegative;
  final bool allowDecimal;
  final int? decimalPlaces;

  SnapNumberInput({
    super.key,
    super.controller,
    super.label,
    super.hint,
    super.error,
    super.helper,
    super.isDisabled = false,
    super.isReadOnly = false,
    super.isRequired = false,
    super.variant = InputVariant.outlined,
    super.size = InputSize.medium,
    this.min,
    this.max,
    this.step,
    this.allowNegative = false,
    this.allowDecimal = false,
    this.decimalPlaces,
  }) : super(
         keyboardType:
             allowDecimal
                 ? TextInputType.numberWithOptions(decimal: true)
                 : TextInputType.number,
         onChanged: (value) {
           if (value.isEmpty) return;
           _validateNumber(
             value,
             allowNegative: allowNegative,
             allowDecimal: allowDecimal,
             min: min,
             max: max,
           );
         },
       );

  static void _validateNumber(
    String value, {
    required bool allowNegative,
    required bool allowDecimal,
    double? min,
    double? max,
  }) {
    // Validate number format
    if (!allowNegative && value.startsWith('-')) {
      return;
    }

    if (!allowDecimal && value.contains('.')) {
      return;
    }

    // Validate min/max
    final number = double.tryParse(value);
    if (number != null) {
      if (min != null && number < min) {
        return;
      }
      if (max != null && number > max) {
        return;
      }
    }
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
          keyboardType: keyboardType,
          textInputAction: TextInputAction.done,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onTap: onTap,
          maxLines: 1,
          showCursor: !isDisabled,
          style: theme.typography.bodyMedium.copyWith(
            color:
                isDisabled ? theme.textColor.withOpacity(0.5) : theme.textColor,
          ),
          decoration: InputDecoration(
            hintText: hint,
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
