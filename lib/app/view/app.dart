import 'dart:ui';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/dependency_injection.dart';

import 'package:sampiro/l10n/gen/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, _) => _App(theme: SampiroTheme.standard),
      medium: (_, _) => _App(theme: SampiroTheme.standard),
      large: (_, _) => _App(theme: SampiroTheme.large),
    );
  }
}

class _App extends StatelessWidget {
  const _App({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
      title: 'Sampiro',
      debugShowCheckedModeBanner: false,
      theme: theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
