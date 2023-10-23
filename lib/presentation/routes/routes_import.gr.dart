// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:flutter_bloc_clean_app/presentation/screens/auth/auth_imports.dart'
    as _i3;
import 'package:flutter_bloc_clean_app/presentation/screens/auth/login/login_imports.dart'
    as _i7;
import 'package:flutter_bloc_clean_app/presentation/screens/auth/register/register_imports.dart'
    as _i9;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/add_post/add_post_imports.dart'
    as _i2;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/category/add_category/add_category_imports.dart'
    as _i1;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/category/categories_imports.dart'
    as _i4;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/dashboard_imports.dart'
    as _i5;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/home/home_imports.dart'
    as _i6;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/tags/tags_imports.dart'
    as _i11;
import 'package:flutter_bloc_clean_app/presentation/screens/onboard/onboard_imports.dart'
    as _i8;
import 'package:flutter_bloc_clean_app/presentation/screens/splash/splash_import.dart'
    as _i10;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AddCategoryRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddCategory(),
      );
    },
    AddPostsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddPosts(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Auth(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Categories(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DashBoard(),
      );
    },
    HomeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomeDetail(
          key: args.key,
          postTitle: args.postTitle,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Login(),
      );
    },
    OnBoardRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OnBoard(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Register(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Splash(),
      );
    },
    TagsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Tags(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCategory]
class AddCategoryRoute extends _i12.PageRouteInfo<void> {
  const AddCategoryRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AddCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCategoryRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddPosts]
class AddPostsRoute extends _i12.PageRouteInfo<void> {
  const AddPostsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AddPostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPostsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Auth]
class AuthRoute extends _i12.PageRouteInfo<void> {
  const AuthRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Categories]
class CategoriesRoute extends _i12.PageRouteInfo<void> {
  const CategoriesRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DashBoard]
class DashBoardRoute extends _i12.PageRouteInfo<void> {
  const DashBoardRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeDetail]
class HomeDetailRoute extends _i12.PageRouteInfo<HomeDetailRouteArgs> {
  HomeDetailRoute({
    _i13.Key? key,
    required String postTitle,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          HomeDetailRoute.name,
          args: HomeDetailRouteArgs(
            key: key,
            postTitle: postTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailRoute';

  static const _i12.PageInfo<HomeDetailRouteArgs> page =
      _i12.PageInfo<HomeDetailRouteArgs>(name);
}

class HomeDetailRouteArgs {
  const HomeDetailRouteArgs({
    this.key,
    required this.postTitle,
  });

  final _i13.Key? key;

  final String postTitle;

  @override
  String toString() {
    return 'HomeDetailRouteArgs{key: $key, postTitle: $postTitle}';
  }
}

/// generated route for
/// [_i7.Login]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OnBoard]
class OnBoardRoute extends _i12.PageRouteInfo<void> {
  const OnBoardRoute({List<_i12.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Register]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.Splash]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Tags]
class TagsRoute extends _i12.PageRouteInfo<void> {
  const TagsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TagsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TagsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
