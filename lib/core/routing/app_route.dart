import 'package:evently/core/routing/page_route_name.dart';
import 'package:evently/features/Home/ui/home_screen.dart';
import 'package:evently/features/create_new_event/ui/create_new_event_screen.dart';
import 'package:evently/features/event_details/ui/event_details_screen.dart';
import 'package:evently/features/forget_password/ui/forget_password_screen.dart';
import 'package:evently/features/layout_view.dart';
import 'package:evently/features/login/ui/login_screen.dart';
import 'package:evently/features/onboarding/ui/onboarding_screen.dart';
import 'package:evently/features/onboarding/ui/on_boarding_widegts.dart';
import 'package:evently/features/signup/ui/signup_screen.dart';
import 'package:evently/features/splash/ui/splash_screen.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/create_new_event/ui/pick_location_screen.dart';

 class AppRouter{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case Routes.initial:{
        return MaterialPageRoute(builder: (context) =>  SplashScreen(),
        settings: settings
        );
      }
      case Routes.onBoarding:{
        return MaterialPageRoute(builder: (context) =>  OnboardingScreen(),
            settings: settings
        );
      }
      case Routes.onBoardingWidgets:{
        return MaterialPageRoute(builder: (context) =>  OnBoardingWidgets(),
            settings: settings
        );
      }
      case Routes.signin:{
        return MaterialPageRoute(builder: (context) =>  LoginScreen(),
            settings: settings
        );
      }
      case Routes.signup:{
        return MaterialPageRoute(builder: (context) =>  SignupScreen(),
            settings: settings
        );
      }
      case Routes.home:{
        return MaterialPageRoute(builder: (context) =>  HomeScreen(),
            settings: settings
        );
      }
      case Routes.forgetPassword:{
        return MaterialPageRoute(builder: (context) =>  ForgetPasswordScreen(),
            settings: settings
        );
      }
      case Routes.layOutView:{
        return MaterialPageRoute(builder: (context) =>  LayoutView(),
            settings: settings
        );
      }
      case Routes.addEvent:{
        return MaterialPageRoute(builder: (context) {
         var event = ModalRoute.of(context)?.settings.arguments as EventDataModel?;
          return CreateNewEventScreen(eventDataModel: event,);
        },
            settings: settings
        );
      } 
      case Routes.eventDetails:{
        return MaterialPageRoute(builder: (context) {
          var event = ModalRoute.of(context)?.settings.arguments as EventDataModel;
          return EventDetailsScreen(eventDataModel: event,);
    },
            settings: settings
        );
      }
      case Routes.pickNewEvent:{
        return MaterialPageRoute(builder: (context) =>  PickLocationScreen(),
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