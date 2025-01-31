import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Home/ui/widgets/custom_event_card.dart';

class LoveScreen extends StatelessWidget {
  const LoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                    borderColor: AppColors.purple,
                    hint: "Search for Event",
                  PrifixIcon: Icon(Icons.search,color: AppColors.purple,),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return CustomListViwEvents();
                  },
                  separatorBuilder: (context,index) => SizedBox(height: 10.h,),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
