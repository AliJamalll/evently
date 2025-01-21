import 'package:evently/core/routing/app_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'evently_app.dart';
import 'firebase_options.dart';

void main() async{
  runApp( EventlyApp(appRouter: AppRouter(),));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}




