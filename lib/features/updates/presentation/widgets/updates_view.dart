import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/l10n/l10n.dart';

class UpdatesView extends StatelessWidget {
  const UpdatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            flexibleSpace: FlexibleSpaceBar(
              background: Assets.images.headerParishUpdates.image(fit: BoxFit.cover),
              centerTitle: true,
              title: ColoredBox(
                color: theme.colorScheme.primary,
                child: Text(
                  l10n.parishUpdates,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.surface,
                    fontWeight: SampiroFontWeight.semiBold,
                  ),
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(),
        ],
      ),
    );
  }
}
