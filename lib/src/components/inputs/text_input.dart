import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

/// A customizable text input component that follows SnapUI's design system.
///
/// The [SnapTextInput] widget provides a consistent text input implementation with
/// various styles, states, and features. It supports labels, hints, error messages,
/// helper text, and different variants (outlined, filled).
///
/// Example usage:
/// ```dart
/// SnapTextInput(
///   label: 'Email',
///   hint: 'Enter your email',
///   keyboardType: TextInputType.emailAddress,
///   onChanged: (value) {
///     // Handle text change
///   },
/// )
/// ```
class SnapTextInput extends StatelessWidget {
  /// Controller for the text input.
  final TextEditingController? controller;

  /// Label text displayed above the input field.
  final String? label;

  /// Hint text displayed when the input is empty.
  final String? hint;

  /// Error message displayed below the input field.
  final String? error;

  /// Helper text displayed below the input field.
  final String? helper;

  /// Whether the input is disabled.
  /// When true, the input cannot be edited.
  final bool isDisabled;

  /// Whether the input is read-only.
  /// When true, the input can be selected but not edited.
  final bool isReadOnly;

  /// Whether the input is required.
  /// When true, displays an asterisk (*) next to the label.
  final bool isRequired;

  /// Whether the input should obscure the text (for passwords).
  final bool isPassword;

  /// The type of keyboard to show.
  final TextInputType? keyboardType;

  /// The action button on the keyboard.
  final TextInputAction? textInputAction;

  /// Callback function that is called when the text changes.
  final void Function(String)? onChanged;

  /// Callback function that is called when the user submits the text.
  final void Function(String)? onSubmitted;

  /// Callback function that is called when the input is tapped.
  final void Function()? onTap;

  /// Widget to display before the input field.
  final Widget? prefix;

  /// Widget to display after the input field.
  final Widget? suffix;

  /// The visual style variant of the input.
  /// See [InputVariant] for available options.
  final InputVariant variant;

  /// The size of the input.
  /// See [InputSize] for available options.
  final InputSize size;

  /// The maximum number of lines to display.
  /// If null, the input can expand to fit the content.
  final int? maxLines;

  /// The minimum number of lines to display.
  final int? minLines;

  /// The maximum number of characters to allow.
  final int? maxLength;

  /// Whether to show the character counter.
  final bool showCounter;

  /// Creates a new [SnapTextInput].
  ///
  /// All parameters are optional except for the callbacks.
  const SnapTextInput({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.error,
    this.helper,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.isRequired = false,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.prefix,
    this.suffix,
    this.variant = InputVariant.outlined,
    this.size = InputSize.medium,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.showCounter = false,
  });

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
          obscureText: isPassword,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onTap: onTap,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          showCursor: !isDisabled,
          style: theme.typography.bodyMedium.copyWith(
            color:
                isDisabled ? theme.textColor.withAlpha(128) : theme.textColor,
          ),
          decoration: InputDecoration(
            hintText: hint,
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
            counterText: showCounter ? null : '',
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
}

/// Defines the visual style variants available for [SnapTextInput].
///
/// The variants determine the input's appearance:
/// * [outlined] - Input with a border around it
/// * [filled] - Input with a filled background
enum InputVariant { outlined, filled }

/// Defines the size options available for [SnapTextInput].
///
/// The sizes determine the input's dimensions:
/// * [small] - Compact input for dense layouts
/// * [medium] - Standard input size
/// * [large] - Prominent input for important fields
enum InputSize { small, medium, large }
