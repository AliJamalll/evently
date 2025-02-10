import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class EventLocationCard extends StatelessWidget {
  const EventLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.purple)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.my_location,
              size: 33,
              color: AppColors.white,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cairo, egypt",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.purple),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
