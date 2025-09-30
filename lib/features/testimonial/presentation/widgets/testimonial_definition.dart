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
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 260, maxWidth: 350),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(UIConstants.radiusCircular),
                    image: DecorationImage(image: AssetImage(Assets.images.headerMamaMary.path), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Center(child: Text(l10n.testimonialMeaning, style: theme.textTheme.bodyMedium)),
            const SizedBox(height: 70),
            ElevatedButton(onPressed: context.router.maybePop, child: Text(l10n.close)),
          ],
        ),
      ),
    );
  }
}
