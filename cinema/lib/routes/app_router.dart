import 'package:auto_route/auto_route.dart';
import 'package:cinema/features/home/view/main_page.dart';
import 'package:cinema/profile_page.dart';
import 'package:flutter/cupertino.dart';

import '../dashboard_page.dart';
import '../features/details/view/secound_page2.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: DashboardRoute.page,
          children: [
            AutoRoute(
              initial: true,
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(page: SecoundRoute.page),
      ];
}
