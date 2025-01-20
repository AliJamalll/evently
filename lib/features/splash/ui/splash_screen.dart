import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text_field.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  var formkey =  GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(appAssets.splashImage,),
                fit: BoxFit.cover,
                  width: 136,
                  height: 188,
                ),
                SizedBox(
                  height: 24,),
                CustomTextField(
                  borderColor: AppColors.grey,
                  hint: 'Email',
                  PrifixIcon: Icon(Icons.email),
                  validator: (value ) {
                    if(value == null || value.isEmpty){
                      return 'this field can\'t be empty';
                    }
                    return null;
                },
                ),
                SizedBox(
                  height: 16,),
                CustomTextField(
                  borderColor: AppColors.grey,
                  hint: 'Password',
                  isPassword: true,
                  PrifixIcon: Icon(Icons.password),
                  validator: (value ) {
                    if(value == null || value.isEmpty){
                      return 'this field can\'t be empty';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                        onPressed: (){},
                        child: Text("Forget Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.purple,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.purple
                        ),
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


