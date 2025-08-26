import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/l10n/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.home,
          style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.surface),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.replaceRoute(const PrayersRoute());
          },
          child: Text(l10n.goToPrayers),
        ),
      ),
    );
  }
}
