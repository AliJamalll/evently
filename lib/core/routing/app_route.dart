import 'package:evently/core/routing/page_route_name.dart';
import 'package:evently/features/splash/ui/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppRouter{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case Routes.initial:{
        return MaterialPageRoute(builder: (context) =>  SplashScreen(),
        settings: settings
        );
      }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No routes defiend for ${settings.name}'),
            ),
          ), // Default route (or error page)
        );

    }
  }
}