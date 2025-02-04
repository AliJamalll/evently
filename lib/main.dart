
import 'package:evently/core/routing/app_route.dart';
import 'package:evently/features/settings_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/services/loading_services.dart';
import 'evently_app.dart';
import 'firebase_options.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (globalContext) => settingsProvider(),
      child: EventlyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
  configLoading(); //custom loading
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
