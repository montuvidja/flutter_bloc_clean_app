// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:flutter_bloc_clean_app/presentation/screens/auth/auth_imports.dart'
    as _i2;
import 'package:flutter_bloc_clean_app/presentation/screens/auth/login/login_imports.dart'
    as _i6;
import 'package:flutter_bloc_clean_app/presentation/screens/auth/register/register_imports.dart'
    as _i8;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/category/add_category/add_category_imports.dart'
    as _i1;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/category/categories_imports.dart'
    as _i3;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/dashboard_imports.dart'
    as _i4;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/home/home_imports.dart'
    as _i5;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/home/home_model.dart'
    as _i13;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/tags/tags_imports.dart'
    as _i10;
import 'package:flutter_bloc_clean_app/presentation/screens/onboard/onboard_imports.dart'
    as _i7;
import 'package:flutter_bloc_clean_app/presentation/screens/splash/splash_import.dart'
    as _i9;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AddCategoryRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddCategory(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Auth(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Categories(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DashBoard(),
      );
    },
    HomeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.HomeDetail(
          key: args.key,
          post: args.post,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.Login(),
      );
    },
    OnBoardRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnBoard(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Register(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Splash(),
      );
    },
    TagsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Tags(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCategory]
class AddCategoryRoute extends _i11.PageRouteInfo<void> {
  const AddCategoryRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AddCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCategoryRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Auth]
class AuthRoute extends _i11.PageRouteInfo<void> {
  const AuthRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Categories]
class CategoriesRoute extends _i11.PageRouteInfo<void> {
  const CategoriesRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DashBoard]
class DashBoardRoute extends _i11.PageRouteInfo<void> {
  const DashBoardRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeDetail]
class HomeDetailRoute extends _i11.PageRouteInfo<HomeDetailRouteArgs> {
  HomeDetailRoute({
    _i12.Key? key,
    required _i13.Post post,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          HomeDetailRoute.name,
          args: HomeDetailRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailRoute';

  static const _i11.PageInfo<HomeDetailRouteArgs> page =
      _i11.PageInfo<HomeDetailRouteArgs>(name);
}

class HomeDetailRouteArgs {
  const HomeDetailRouteArgs({
    this.key,
    required this.post,
  });

  final _i12.Key? key;

  final _i13.Post post;

  @override
  String toString() {
    return 'HomeDetailRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i6.Login]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnBoard]
class OnBoardRoute extends _i11.PageRouteInfo<void> {
  const OnBoardRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.Register]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute({List<_i11.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Splash]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.Tags]
class TagsRoute extends _i11.PageRouteInfo<void> {
  const TagsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TagsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TagsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
