import 'package:app_ui/app_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SampiroDropDown<T> extends StatelessWidget {
  const SampiroDropDown({
    required this.dropDownMenuItem,
    required this.onChanged,
    this.initialValue,
    this.validator,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.isValid = false,
    this.readOnly = false,
    this.label,
    super.key,
  });
  final T? initialValue;
  final List<DropdownMenuItem<T>> dropDownMenuItem;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool readOnly;
  final String? label;

  /// If true, it changes the border and label color of text field.
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

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
                  style: theme.textTheme.bodyMedium?.copyWith(fontWeight: SampiroFontWeight.semiBold),
                  maxLines: 1,
                ),
                const SizedBox(width: 2),
                if (isValid) const Icon(Icons.check, size: 18),
              ],
            ),
          ),
        DropdownButtonFormField<T>(
          validator: validator,
          menuMaxHeight: size.height * .5,
          dropdownColor: theme.colorScheme.surface,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_outlined, color: theme.colorScheme.shadow),
          style: theme.textTheme.titleSmall,
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.colorScheme.surface,

            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            errorStyle: const TextStyle(fontSize: 0, color: Colors.transparent), // Hides error text
            floatingLabelBehavior: floatingLabelBehavior,
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
          initialValue: initialValue,
          items: dropDownMenuItem,
          onChanged: readOnly ? null : onChanged,
        ),
      ],
    );
  }
}
