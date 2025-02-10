import 'package:evently/core/utils/firebase_firestore_service.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/routing/page_route_name.dart';
import '../../../../core/theme/app_colors.dart';

class CustomListViwEvents extends StatelessWidget {
  const CustomListViwEvents({super.key, required this.eventDataModel});

  final EventDataModel eventDataModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: (){
        Navigator.pushNamed(context, Routes.eventDetails,arguments: eventDataModel);
      },
      child: Container(
          padding: EdgeInsets.all(8),
          width: 361.w,
          height: 203.h,
          decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.purple, width: 1.5),
              image: DecorationImage(
                  image: AssetImage(eventDataModel.eventImage),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    DateFormat("dd MMM").format(eventDataModel.eventDate),
                    style: TextStyle(
                        color: AppColors.purple,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        eventDataModel.eventTitle,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        var eventData = EventDataModel(
                          eventId: eventDataModel.eventId,
                          eventTitle: eventDataModel.eventTitle,
                          eventImage: eventDataModel.eventImage,
                          eventDescription: eventDataModel.eventDescription,
                          eventCategory: eventDataModel.eventCategory,
                          eventDate: eventDataModel.eventDate,
                          isFavorite: !eventDataModel.isFavorite,
                        );

                        FirebaseFireStoreService.updateEvent(eventData);
                      },
                      child: Icon(
                        eventDataModel.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: AppColors.purple,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
