import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_route.dart';
import 'core/routing/page_route_name.dart';

class EventlyApp extends StatelessWidget {
  final AppRouter appRouter;
  const EventlyApp({super.key,required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Evently',
        theme: ThemeData(),
        // theme: appThemeManager.lightTheme, // Ensure `appThemeManager` is initialized properly
        // darkTheme: appThemeManager.darkTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: Routes.initial,
      )
    );
  }
}

