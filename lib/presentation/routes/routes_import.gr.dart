// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i16;
import 'package:flutter_bloc_clean_app/presentation/screens/auth/auth_imports.dart'
    as _i3;
import 'package:flutter_bloc_clean_app/presentation/screens/auth/login/login_imports.dart'
    as _i7;
import 'package:flutter_bloc_clean_app/presentation/screens/auth/register/register_imports.dart'
    as _i9;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/category/add_category/add_category_imports.dart'
    as _i1;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/category/categories_imports.dart'
    as _i4;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/category/category_model.dart'
    as _i15;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/category/update_category/update_category_imports.dart'
    as _i12;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/dashboard_imports.dart'
    as _i5;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/home/home_imports.dart'
    as _i6;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/home/home_model.dart'
    as _i17;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/tags/add_tags/add_tag_imports.dart'
    as _i2;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/tags/tags_imports.dart'
    as _i11;
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/tags/update_tags/update_tag_imports.dart'
    as _i13;
import 'package:flutter_bloc_clean_app/presentation/screens/onboard/onboard_imports.dart'
    as _i8;
import 'package:flutter_bloc_clean_app/presentation/screens/splash/splash_import.dart'
    as _i10;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    AddCategoryRoute.name: (routeData) {
      return _i14.AutoRoutePage<_i15.CategoryModel>(
        routeData: routeData,
        child: const _i1.AddCategory(),
      );
    },
    AddTagRoute.name: (routeData) {
      return _i14.AutoRoutePage<_i11.TagsModel>(
        routeData: routeData,
        child: const _i2.AddTag(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Auth(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i14.AutoRoutePage<_i15.Category>(
        routeData: routeData,
        child: const _i4.Categories(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DashBoard(),
      );
    },
    HomeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomeDetail(
          key: args.key,
          post: args.post,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Login(),
      );
    },
    OnBoardRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OnBoard(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Register(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Splash(),
      );
    },
    TagsRoute.name: (routeData) {
      return _i14.AutoRoutePage<_i11.Tag>(
        routeData: routeData,
        child: const _i11.Tags(),
      );
    },
    UpdateCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateCategoryRouteArgs>();
      return _i14.AutoRoutePage<_i15.CategoryModel>(
        routeData: routeData,
        child: _i12.UpdateCategory(
          key: args.key,
          category: args.category,
        ),
      );
    },
    UpdateTagRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateTagRouteArgs>();
      return _i14.AutoRoutePage<_i11.TagsModel>(
        routeData: routeData,
        child: _i13.UpdateTag(
          key: args.key,
          tag: args.tag,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCategory]
class AddCategoryRoute extends _i14.PageRouteInfo<void> {
  const AddCategoryRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AddCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCategoryRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddTag]
class AddTagRoute extends _i14.PageRouteInfo<void> {
  const AddTagRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AddTagRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTagRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Auth]
class AuthRoute extends _i14.PageRouteInfo<void> {
  const AuthRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Categories]
class CategoriesRoute extends _i14.PageRouteInfo<void> {
  const CategoriesRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DashBoard]
class DashBoardRoute extends _i14.PageRouteInfo<void> {
  const DashBoardRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeDetail]
class HomeDetailRoute extends _i14.PageRouteInfo<HomeDetailRouteArgs> {
  HomeDetailRoute({
    _i16.Key? key,
    required _i17.Post post,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          HomeDetailRoute.name,
          args: HomeDetailRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailRoute';

  static const _i14.PageInfo<HomeDetailRouteArgs> page =
      _i14.PageInfo<HomeDetailRouteArgs>(name);
}

class HomeDetailRouteArgs {
  const HomeDetailRouteArgs({
    this.key,
    required this.post,
  });

  final _i16.Key? key;

  final _i17.Post post;

  @override
  String toString() {
    return 'HomeDetailRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i7.Login]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OnBoard]
class OnBoardRoute extends _i14.PageRouteInfo<void> {
  const OnBoardRoute({List<_i14.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Register]
class RegisterRoute extends _i14.PageRouteInfo<void> {
  const RegisterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.Splash]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Tags]
class TagsRoute extends _i14.PageRouteInfo<void> {
  const TagsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          TagsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TagsRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.UpdateCategory]
class UpdateCategoryRoute extends _i14.PageRouteInfo<UpdateCategoryRouteArgs> {
  UpdateCategoryRoute({
    _i16.Key? key,
    required _i15.Category category,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          UpdateCategoryRoute.name,
          args: UpdateCategoryRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateCategoryRoute';

  static const _i14.PageInfo<UpdateCategoryRouteArgs> page =
      _i14.PageInfo<UpdateCategoryRouteArgs>(name);
}

class UpdateCategoryRouteArgs {
  const UpdateCategoryRouteArgs({
    this.key,
    required this.category,
  });

  final _i16.Key? key;

  final _i15.Category category;

  @override
  String toString() {
    return 'UpdateCategoryRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i13.UpdateTag]
class UpdateTagRoute extends _i14.PageRouteInfo<UpdateTagRouteArgs> {
  UpdateTagRoute({
    _i16.Key? key,
    required _i11.Tag tag,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          UpdateTagRoute.name,
          args: UpdateTagRouteArgs(
            key: key,
            tag: tag,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateTagRoute';

  static const _i14.PageInfo<UpdateTagRouteArgs> page =
      _i14.PageInfo<UpdateTagRouteArgs>(name);
}

class UpdateTagRouteArgs {
  const UpdateTagRouteArgs({
    this.key,
    required this.tag,
  });

  final _i16.Key? key;

  final _i11.Tag tag;

  @override
  String toString() {
    return 'UpdateTagRouteArgs{key: $key, tag: $tag}';
  }
}
