import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/l10n/l10n.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return AutoTabsRouter(
      // list of your tab routes
      // routes used here must be declared as children
      // routes of /dashboard
      routes: const [
        HomeRoute(),
        UpdatesRoute(),
        ServicesRoute(),
        PrayersRoute(),
        MoreRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      builder: (context, child) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor ?? theme.colorScheme.primary,
        // alternatively, you could use a global key
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: theme.colorScheme.shadow.withValues(alpha: .7),
            selectedItemColor: theme.colorScheme.surface,
            currentIndex: tabsRouter.activeIndex,
            backgroundColor: theme.colorScheme.primary, // this works
            type: BottomNavigationBarType.fixed, // make sure this is set
            // backgroundColor: theme.colorScheme.primary,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(label: l10n.home, icon: const Icon(Icons.house)),
              BottomNavigationBarItem(label: l10n.updates, icon: const Icon(Icons.newspaper)),
              BottomNavigationBarItem(label: l10n.services, icon: const Icon(Icons.build)),
              BottomNavigationBarItem(label: l10n.prayers, icon: const Icon(Icons.handshake)),

              BottomNavigationBarItem(label: l10n.more, icon: const Icon(Icons.menu)),
            ],
          ),
        );
      },
    );
  }
}
