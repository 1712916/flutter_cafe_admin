import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cafe_admin/page/page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            AutoRoute(page: UserRoute.page, path: ''),
            CustomRoute(
              page: UserRoute.page,
              path: 'user',
            ),
            CustomRoute(
              page: User2Route.page,
              path: 'user2',
            ),
          ],
        ),
        AutoRoute(page: UserRoute.page, path: '/user'),
      ];
}
