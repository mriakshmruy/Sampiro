import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/l10n/l10n.dart';

class TestimonialDefinition extends StatelessWidget {
  const TestimonialDefinition({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Padding(
      padding: UIConstants.pagePadding,
      child: ColoredBox(
        color: theme.colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 350, maxWidth: 500),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(UIConstants.radiusCircular),
                    image: DecorationImage(image: AssetImage(Assets.images.headerMamaMary.path), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsetsGeometry.all(12),
              child: Text(
                l10n.testimonialMeaning,
                style: theme.textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(onPressed: context.router.maybePop, child: Text(l10n.close)),
          ],
        ),
      ),
    );
  }
}
