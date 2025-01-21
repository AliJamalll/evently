import 'package:evently/core/routing/page_route_name.dart';
import 'package:evently/core/widgets/custom_snack_bar.dart';
import 'package:evently/features/login/ui/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_filed_button.dart';
import '../../../core/widgets/custom_flags.dart';
import '../../../core/widgets/custom_outlined_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    appAssets.splashImage,
                  ),
                  fit: BoxFit.cover,
                  width: 136,
                  height: 188,
                ),
                SizedBox(
                  height: 24,
                ),
                CustomTextField(
                  borderColor: AppColors.grey,
                  hint: 'Name',
                  PrifixIcon: Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  borderColor: AppColors.grey,
                  hint: 'Email',
                  PrifixIcon: Icon(Icons.email),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  borderColor: AppColors.grey,
                  hint: 'Password',
                  isPassword: true,
                  PrifixIcon: Icon(Icons.password),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  borderColor: AppColors.grey,
                  hint: 'Password',
                  isPassword: true,
                  PrifixIcon: Icon(Icons.password),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomButton(
                  onPressed: (){
                    if(formkey.currentState!.validate()){
                      Navigator.of(context).pushNamed(Routes.home);
                      ShowSnackBar("log in successfully", context);
                    }else{
                      ShowSnackBar("empty fields", context);
                    }
                  },
                  text: "Create Account",
                  buttonColor: AppColors.purple,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account ?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                    ),

                    TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, Routes.signin);
                        },
                        child:Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.purple,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.purple),
                        )
                    )
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                SwappableImagesContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
