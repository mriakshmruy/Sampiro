import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/l10n/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.cairo,
          style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.shadow),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // Assets.images.header.image(),
            ElevatedButton(
              onPressed: () {
                context.pushRoute(const PrayersRoute());
              },
              child: Text(
                l10n.goToPrayers,
                style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.primary),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.pushRoute(const DashboardRoute());
              },
              child: Text(
                l10n.dashboard,
                style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
