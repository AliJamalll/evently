import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Divider(
                thickness: 2,
                color: AppColors.purple,
              )),
          Text(
            "or",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.purple,
            ),
          ),
          Expanded(
              child: Divider(
                thickness: 2,
                color: AppColors.purple,
              ))
        ],
      ),
    );
  }
}
