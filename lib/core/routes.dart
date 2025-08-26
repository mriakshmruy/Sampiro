import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:sampiro/features/home/presentation/pages/home_page.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Page|Screen,Route')
@lazySingleton
class AppRouter extends RootStackRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: HomeRoute.page, initial: true),
  ];
}
