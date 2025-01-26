import 'package:evently/core/extentions/validations.dart';
import 'package:evently/core/routing/page_route_name.dart';
import 'package:evently/core/utils/firabase_services.dart';
import 'package:evently/core/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_filed_button.dart';
import '../../../core/widgets/custom_flags.dart';
import '../../../core/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {

  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formkey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Register",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
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
                    controller: _nameController,
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
                    controller: _emailController,
                    borderColor: AppColors.grey,
                    hint: 'Email',
                    PrifixIcon: Icon(Icons.email),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field can\'t be empty';
                      }
                      if(!Validations.validateEmail(value)){
                        return "please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    borderColor: AppColors.grey,
                    hint: 'Password',
                    isPassword: true,
                    PrifixIcon: Icon(Icons.password),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field can\'t be empty';
                      }
                      if(!Validations.validatePassword(value)){
                        return "please enter a valid password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    controller: _confirmPasswordController,
                    borderColor: AppColors.grey,
                    hint: 'Re - Password',
                    isPassword: true,
                    PrifixIcon: Icon(Icons.password),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field can\'t be empty';
                      }
                      if(value != _passwordController.text){
                        return "please enter the same password";
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
                        FirebaseServices.signUp(
                            _emailController.text,
                            _passwordController.text, context)
                            .then((value){
                              EasyLoading.dismiss();
                              if(value){
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.signin,
                                    (route) => false
                                );
                              }
                        });
                        ShowSnackBar("Email created successfully", context);
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
      ),
    );
  }
}
