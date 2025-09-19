import 'package:app_ui/app_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SampiroTimePicker extends StatelessWidget {
  const SampiroTimePicker({this.label, this.onTimeSelected, this.initialValue, this.isValid = false, super.key});
  final String? label;
  final ValueChanged<TimeOfDay>? onTimeSelected;
  final String? initialValue;
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
                  style: theme.textTheme.bodyMedium?.copyWith(fontWeight: SampiroFontWeight.semiBold),
                  maxLines: 1,
                ),
                const SizedBox(width: 2),
                if (isValid) const Icon(Icons.check, size: 18),
              ],
            ),
          ),
        GestureDetector(
          onTap: () async {
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              initialEntryMode: TimePickerEntryMode.inputOnly,
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    timePickerTheme: TimePickerThemeData(
                      backgroundColor: theme.colorScheme.primary,
                      helpTextStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.surface),
                      dayPeriodTextColor: theme.colorScheme.surface, // Text color for unselected AM/PM

                      dayPeriodColor: WidgetStateColor.resolveWith(
                        (states) => states.contains(WidgetState.selected)
                            ? theme
                                  .colorScheme
                                  .primary // Background color for selected AM/PM
                            : theme.colorScheme.shadow.withValues(alpha: .8),
                      ),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(theme.colorScheme.surface),
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (pickedTime == null) return;
            onTimeSelected?.call(pickedTime);
          },
          child: Container(
            height: 55,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isValid ? theme.colorScheme.primary : theme.colorScheme.tertiary,
                width: isValid ? 1.5 : .8,
              ),
            ),
            child: Text(initialValue ?? '', style: theme.textTheme.bodyMedium),
          ),
        ),
      ],
    );
  }
}
