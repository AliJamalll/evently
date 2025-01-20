import 'package:evently/core/routing/app_route.dart';
import 'package:evently/core/theme/app_theme_manager.dart';
import 'package:evently/features/splash/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/routing/page_route_name.dart';
import 'features/login/ui/login_screen.dart';
import 'firebase_options.dart';

void main() async{

  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evently',
      theme: ThemeData(),
      // theme: appThemeManager.lightTheme, // Ensure `appThemeManager` is initialized properly
      // darkTheme: appThemeManager.darkTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: Routes.initial,
    );
  }
}


