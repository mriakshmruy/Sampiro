import 'package:app_ui/app_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SampiroTextField extends StatelessWidget {
  const SampiroTextField({
    this.controller,
    this.initialValue,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters = const [],
    this.textCapitalization = TextCapitalization.sentences,
    this.errorText,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.autofocus = false,
    this.showErrorText = false,
    this.readOnly = false,
    this.prefixText,
    this.minLines = 1,
    this.maxLines = 1,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.label,
    this.hintText,
    this.isValid = false,
    this.validator,
    super.key,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter> inputFormatters;
  final TextCapitalization textCapitalization;
  final String? errorText;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool readOnly;
  final String? prefixText;
  final bool autofocus;
  final bool showErrorText;
  final int minLines;
  final int maxLines;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final String? label;
  final String? hintText;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                AutoSizeText(
                  label!,
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(fontWeight: SampiroFontWeight.semiBold, color: theme.colorScheme.tertiary),
                  maxLines: 1,
                ),
                const SizedBox(width: 2),
                if (isValid) const Icon(Icons.check, size: 18),
              ],
            ),
          ),
        TextFormField(
          textAlign: textAlign,
          focusNode: focusNode,
          minLines: minLines,
          maxLines: maxLines,
          readOnly: readOnly,
          enabled: !readOnly,
          autofocus: autofocus,
          textCapitalization: textCapitalization,
          initialValue: initialValue,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: SampiroFontWeight.regular,
            color: theme.colorScheme.tertiary,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.shadow),
            prefixText: prefixText,
            labelStyle: theme.textTheme.bodyMedium,
            prefixStyle: theme.textTheme.titleSmall,
            filled: true,
            fillColor: theme.colorScheme.surface,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            floatingLabelBehavior: floatingLabelBehavior,
            errorText: errorText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isValid ? theme.colorScheme.primary : theme.colorScheme.tertiary,
                width: isValid ? 1.5 : .8,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.primary, width: 2.2),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.error, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.error, width: 1.8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.shadow),
            ),
          ),
          inputFormatters: inputFormatters,
          validator: validator,
        ),
      ],
    );
  }
}
