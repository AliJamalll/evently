import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';

class SwappableThemeContainer extends StatefulWidget {
  const SwappableThemeContainer({super.key});

  @override
  _SwappableImagesContainerState createState() =>
      _SwappableImagesContainerState();
}

class _SwappableImagesContainerState extends State<SwappableThemeContainer> {
  String leftImage = appAssets.moon;
  String rightImage = appAssets.sun;

  void swapImages() {
    setState(() {
      String temp = leftImage;
      leftImage = rightImage;
      rightImage = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.purple, width: 3),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: swapImages,
              child: Image(
                image: AssetImage(leftImage),
                color: AppColors.purple,
              ),
            ),
            SizedBox(width: 10.w),
            InkWell(
              onTap: swapImages,
              child: Image(
                image: AssetImage(rightImage),
                color: AppColors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
