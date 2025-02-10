import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/utils/firabase_services.dart';
import 'package:evently/core/widgets/custom_filed_button.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});

  final _emailController = TextEditingController();

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
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              Image(image: AssetImage(appAssets.fgpassword),
              fit: BoxFit.cover,
                width: double.infinity,
              ),
              CustomTextField(
                controller: _emailController,
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
              CustomButton(
                  text: "Reset Password",
                  buttonColor: AppColors.purple,
                  onPressed: (){
                    FirebaseServices.resetPassword(_emailController.text);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
