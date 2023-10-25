part of 'routes_import.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    /// routes go here
    AutoRoute(page: SplashRoute.page,path: "/", initial: true),
    AutoRoute(page: OnBoardRoute.page),
    AutoRoute(page: AuthRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: DashBoardRoute.page),
    AutoRoute(page: CategoriesRoute.page),
    AutoRoute(page: TagsRoute.page),
    AutoRoute(page: AddCategoryRoute.page),
    AutoRoute(page: HomeDetailRoute.page),
  ];
}