import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CustomOnBoarding extends StatelessWidget {
  CustomOnBoarding(
      {super.key, required this.title, required this.image, this.desc});

  String image;
  String title;
  String? desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.purple),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: Text(
              desc!,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
