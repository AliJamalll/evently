import 'dart:async';

import 'package:evently/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/page_route_name.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, Routes.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 350.h,
            ),
            SizedBox(
              height: mediaQuery.height * 0.25.h,
              width: 136.w,
              child: Image(image: AssetImage(appAssets.splashImage)),
            ),
            Spacer(),
            Image(image: AssetImage(appAssets.splashDown))
          ],
        ),
      ),
    );
  }
}
