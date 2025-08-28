import 'package:flutter/material.dart';
import 'package:sampiro/l10n/l10n.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.menu,
          style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.primary),
        ),
      ),
    );
  }
}
