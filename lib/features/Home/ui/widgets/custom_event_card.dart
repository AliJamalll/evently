import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class CustomListViwEvents extends StatelessWidget {
  const CustomListViwEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
        width: 361.w,
        height: 203.h,
        decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.purple, width: 1.5),
            image: DecorationImage(
                image: AssetImage(appAssets.sport), fit: BoxFit.cover)),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text(" 21\nJan",
              style: TextStyle(
                color: AppColors.purple,
                fontWeight: FontWeight.w700,
                fontSize: 20
              ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text("Meeting for Updating The Development Method ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.favorite_border,color: AppColors.purple,)
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
