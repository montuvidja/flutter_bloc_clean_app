import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_app/data/core/themes/app_theme.dart';
import 'package:flutter_bloc_clean_app/data/repositories/auth_repo.dart';
import 'package:flutter_bloc_clean_app/data/repositories/home_repo.dart';
import 'package:flutter_bloc_clean_app/data/repositories/repository.dart';
import 'package:flutter_bloc_clean_app/data/repositories/tag_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/routes/routes_import.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => Repository(
      tagsRepo: TagsRepo(),
      authRepo: AuthRepo(),
      homeRepo: HomeRepo(),
    ),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: _appRouter.config(),
            title: 'Flutter Demo',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.light,
          );
        });
  }
}
