import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_app/data/core/themes/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/routes/routes_import.dart';

void main() {
  runApp(MyApp());
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
      builder: (context,child) {
        return MaterialApp.router(
          routerConfig: _appRouter.config(),
          title: 'Flutter Demo',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,

         // home: const MyHomePage(title: MyStrings.appName),
        );
      }
    );
  }
}
