import 'package:evently/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_widgets.dart';

class OnBoardingWidgets extends StatelessWidget {
  const OnBoardingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image(
                  image: AssetImage(
                appAssets.onboarding1,
              ),
                width: 159.w,
                height: 50.h,
              ),
            ),
            Expanded(child: CustomWidgets())
          ],
        ),
      ),
    );
  }
}
