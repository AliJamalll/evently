import 'package:bot_toast/bot_toast.dart';
import 'package:evently/core/theme/app_theme_manager.dart';
import 'package:evently/features/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'core/routing/app_route.dart';
import 'core/routing/page_route_name.dart';

class EventlyApp extends StatelessWidget {
  final AppRouter appRouter;
   EventlyApp({super.key,required this.appRouter});


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<settingsProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Evently',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.currentLanguage),
        theme: appThemeManager.lightThemeData,
        darkTheme: appThemeManager.darkThemeData,
        themeMode: provider.currentThemeMode,
        onGenerateRoute: AppRouter.onGenerateRoute,
        builder: EasyLoading.init(
          builder: BotToastInit()
        ),
        initialRoute: Routes.initial,
      )
    );
  }
}

