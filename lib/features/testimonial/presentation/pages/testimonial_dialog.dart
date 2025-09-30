import 'package:flutter/material.dart';
import 'package:sampiro/l10n/l10n.dart';

class TestimonialDialog extends StatelessWidget {
  const TestimonialDialog({required this.submitted, super.key, this.onPressed});

  final String submitted;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      // title: const Text('Testimonial Submitted'),
      content: Text(
        l10n.yourTestimonialHasBeenSubmitted,
      ),
      actions: [TextButton(onPressed: onPressed, child: const Text('ok'))],
    );
  }
}
