import 'package:bot_toast/bot_toast.dart';
import 'package:evently/core/theme/app_theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
        theme: appThemeManager.lightThemeData,
        darkTheme: appThemeManager.darkThemeData,
        themeMode: ThemeMode.light,
        onGenerateRoute: AppRouter.onGenerateRoute,
        builder: EasyLoading.init(
          builder: BotToastInit()
        ),
        initialRoute: Routes.initial,
      )
    );
  }
}

