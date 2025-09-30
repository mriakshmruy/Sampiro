import 'package:flutter/material.dart';
import 'package:sampiro/core/widgets/sampiro_app_bar.dart';
import 'package:sampiro/l10n/l10n.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: SampiroAppBar(
        title: l10n.menu,
      ),

      // appBar: AppBar(
      //   title: Text(
      //     l10n.menu,
      //     style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.primary),
      //   ),
      // ),
    );
  }
}
