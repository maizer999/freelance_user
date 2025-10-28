import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freelance_user/routes/route_constant.dart';
import 'package:freelance_user/routes/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig(replaceInRouteName: 'Screen|View|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter({
    super.navigatorKey,
  });

  @override
  late final List<AutoRoute> routes = [

    CustomRoute(
      page: CommonResponseDialogRoute.page,
      path: Routes.commonDialog,
      customRouteBuilder:
      <T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
        return DialogRoute(
          context: context,

          // this is important
          settings: page,
          builder: (_) => child,

          useSafeArea: true,
        );
      },
    ),

    AutoRoute(
      page: DobCalendarRoute.page,
      path: "/dob",
      children: [
        AutoRoute(
          page: GregorianTabRoute.page,
          path: "geo",
        ),
        AutoRoute(
          page: HijriTabRoute.page,
          path: "hijr",
        ),
      ],
    ),

    // AutoRoute(
    //     page: UserLoginRoute.page, initial: true, guards: [GetInitialRoute()]),
   ];

}

// class GetInitialRoute extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) async {
//     final accessToken = await SecureStorageHelper.getAccessToken();
//     final tempAccessToken = await SecureStorageHelper.getTempAccessToken();
//
//     if (accessToken == null && tempAccessToken == null) {
//       resolver.next(true);
//     } else {
//       router.push(MainHomeRoute());
//     }
//   }
// }
