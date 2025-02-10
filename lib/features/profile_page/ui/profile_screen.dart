import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/utils/firabase_services.dart';
import 'package:evently/core/widgets/custom_filed_button.dart';
import 'package:evently/features/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../login/ui/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
  var provider = Provider.of<settingsProvider>(context);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.25,
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(85)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0), // Move the Row down
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: Image(
                          image: AssetImage(appAssets.egypt),
                          width: 200,
                          height: 200,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ali Jamal',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      'ali@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Langauge ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomDropdown<String>(
            hintText: provider.currentLanguage == "en" ? "English":"عربي",
            items: provider.languages,
            onChanged: (value) {
              if(value == "English") provider.setNewLanguage("en");
              if(value != "English") provider.setNewLanguage("ar");
              log('changing value to: $value');
            },
            decoration: CustomDropdownDecoration(
              closedBorderRadius: BorderRadius.circular(18),
              closedSuffixIcon: Icon(Icons.arrow_drop_down_rounded,
              size: 28,
                color: AppColors.purple,
              ),
              closedBorder: Border.all(
                color: AppColors.purple,
                width: 1.8
              ),
            ),
          ), // 
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Theme ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomDropdown<String>(
            hintText: provider.isDarkTheme() ? "Dark" : "Light",
            items: provider.Themes,
            onChanged: (value) {
              if(value == "Dark") provider.setNewTheme(ThemeMode.dark);
              if(value == "light") provider.setNewTheme(ThemeMode.light);
              log('changing value to: $value');
            },
            decoration: CustomDropdownDecoration(
              closedBorderRadius: BorderRadius.circular(18),
              closedSuffixIcon: Icon(Icons.arrow_drop_down_rounded,
                size: 28,
                color: AppColors.purple,
              ),
              closedBorder: Border.all(
                  color: AppColors.purple,
                  width: 1.8
              ),
            ),
          ), //
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomButton(
            priffixIcon: Icons.logout,
            text: "Logout",
            onPressed: () {
              FirebaseServices.signOut();
              if (context.mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              }
            },
            buttonColor: Colors.red,
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    ));
  }
}
