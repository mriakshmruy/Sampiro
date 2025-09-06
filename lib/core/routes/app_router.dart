@RoutePage()
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sampiro/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:sampiro/features/home/presentation/pages/home_page.dart';
import 'package:sampiro/features/menu/presentation/pages/menu_page.dart';
import 'package:sampiro/features/more/presentation/pages/more_page.dart';
import 'package:sampiro/features/prayers/data/models/prayers_model.dart';
import 'package:sampiro/features/prayers/presentation/pages/prayers_information_page.dart';
import 'package:sampiro/features/prayers/presentation/pages/prayers_page.dart';
import 'package:sampiro/features/services/presentation/pages/baptismal_certificate_page.dart';
import 'package:sampiro/features/services/presentation/pages/counseling_page.dart';
import 'package:sampiro/features/services/presentation/pages/services_page.dart';
import 'package:sampiro/features/updates/presentation/pages/updates_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Page|Screen,Route')
@lazySingleton
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: DashboardRoute.page,
      children: [
        AutoRoute(
          path: 'home',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: 'prayers',
          page: PrayersRoute.page,
        ),

        AutoRoute(
          path: 'menu',
          page: MenuRoute.page,
        ),
        AutoRoute(
          path: 'more',
          page: MoreRoute.page,
        ),
        AutoRoute(
          path: 'services',
          page: ServicesRoute.page,
        ),
        AutoRoute(
          path: 'updates',
          page: UpdatesRoute.page,
        ),
      ],

      initial: true,
    ),

    AutoRoute(
      path: '/prayers-info',
      page: PrayersInformationRoute.page,
    ),

    AutoRoute(
      path: '/baptismal-cert',
      page: BaptismalCertificateRoute.page,
    ),

    AutoRoute(
      path: '/counseling',
      page: CounselingRoute.page,
    ),
  ];
}
