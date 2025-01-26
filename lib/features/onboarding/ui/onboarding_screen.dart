import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/widgets/custom_filed_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/page_route_name.dart';
import '../../../core/widgets/custom_flags.dart';
import '../../../core/widgets/custom_themes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Image(
                  image: AssetImage(appAssets.onboarding1),
                  width: 159.w,
                  height: 50.h,
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              Image(
                image: AssetImage(appAssets.onboarding2),
                fit: BoxFit.cover,
                width: 361.w,
              ),
              SizedBox(
                height: 28.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personalize Your Experience',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.purple),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  """Choose your preferred theme and language to\nget started with a comfortable, tailored\nexperience that suits your style.
                """,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Language",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.purple),
                  ),
                  Spacer(),
                  SwappableImagesContainer()
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Text(
                    "Theme",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.purple),
                  ),
                  Spacer(),
                  SwappableThemeContainer()
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomButton(
                text: "Let’s Start",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.onBoardingWidgets);
                },
                buttonColor: AppColors.purple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
