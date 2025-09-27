import 'package:flutter/material.dart';

class SampiroTestimonialButton extends StatelessWidget {
  const SampiroTestimonialButton({required this.label, super.key, this.onPressed});

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: theme.colorScheme.primary),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.surface, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
