import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:sampiro/features/home/presentation/pages/home_page.dart';
import 'package:sampiro/features/menu/presentation/pages/menu_page.dart';
import 'package:sampiro/features/prayers/presentation/pages/prayers_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Page|Screen,Route')
@lazySingleton
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: HomeRoute.page,
      initial: true,
    ),
    AutoRoute(
      path: '/prayers',
      page: PrayersRoute.page,
    ),
    AutoRoute(
      path: '/menu',
      page: MenuRoute.page,
    ),
  ];
}
