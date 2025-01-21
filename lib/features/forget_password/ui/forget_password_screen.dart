import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/widgets/custom_filed_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forget Password",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,

          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 24,
          children: [
            Image(image: AssetImage(appAssets.fgpassword),
            fit: BoxFit.cover,
              width: double.infinity,
            ),
            CustomButton(
                text: "Reset Password",
                buttonColor: AppColors.purple,
                onPressed: (){}
            )
          ],
        ),
      ),
    );
  }
}
