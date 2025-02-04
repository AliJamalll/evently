import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/models/event_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapItem extends StatelessWidget {
  const TapItem(
      {super.key, required this.eventModel, required this.isSelected});

  final eventCategoryModel eventModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? AppColors.purple : AppColors.white,
        border: Border.all(
          color: AppColors.purple
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            eventModel.eventCatIcon,
            color: isSelected ? AppColors.white : AppColors.purple,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            eventModel.eventCatName,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.white : AppColors.purple),
          )
        ],
      ),
    );
  }
}

class TapItem2 extends StatelessWidget {
  const TapItem2(
      {super.key, required this.eventModel, required this.isSelected});

  final eventCategoryModel eventModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? AppColors.white : AppColors.purple,
          border: Border.all(
              color: AppColors.white
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            eventModel.eventCatIcon,
            color: isSelected ? AppColors.purple : AppColors.white,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            eventModel.eventCatName,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.purple : AppColors.white),
          )
        ],
      ),
    );
  }
}
