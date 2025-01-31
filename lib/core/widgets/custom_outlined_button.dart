import 'dart:io';

import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledButton extends StatelessWidget {
  CustomFilledButton({super.key,required this.text,this.buttonColor,this.image,required this.onPressed,this.priffexIcon,this.suffixIcon});

  String text;
  Color? buttonColor;
  String? image;
  VoidCallback onPressed;
  IconData? priffexIcon;
  IconData? suffixIcon;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
              foregroundColor: AppColors.purple,
              side: BorderSide(
                color: buttonColor ?? AppColors.purple
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null) ...[ // Conditionally render the image
                Image.asset(
                  image!,
                  height: 24, // Adjust height as needed
                  width: 24,  // Adjust width as needed
                ),
                const SizedBox(width: 10), // Space between image and text
              ],
              Icon(priffexIcon,size: 25,color: AppColors.purple,),
              SizedBox(width: 10,),
              Text(text,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
              Spacer(),
              Icon(suffixIcon,size: 25,color: AppColors.purple,),
            ],
          )
      ),
    );
  }
}