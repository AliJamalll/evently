import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,required this.text,this.buttonColor,required this.onPressed,this.priffixIcon});

  String text;
  Color? buttonColor;
  VoidCallback onPressed;
  IconData? priffixIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (priffixIcon != null) ...[
                Icon(priffixIcon, size: 25, color: AppColors.white),
                SizedBox(width: 10), // Adds spacing only if icon exists
              ],
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )

      ),
    );
  }
}