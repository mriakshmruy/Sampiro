import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/features/testimonial/data/models/parish_testimonial_model.dart';

class TestimonialTile extends StatelessWidget {
  const TestimonialTile({required this.testimonial, super.key});

  final ParishTestimonialModel testimonial;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: UIConstants.pagePadding,
      decoration: BoxDecoration(color: theme.colorScheme.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            testimonial.testimonials,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: SampiroFontWeight.medium,
            ),
          ),

          Text(
            '\t ${testimonial.elapsedTime}',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.tertiary,
              fontWeight: SampiroFontWeight.regular,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            '-${testimonial.name}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.tertiary,
              fontWeight: SampiroFontWeight.regular,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
