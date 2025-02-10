import 'package:evently/core/routing/page_route_name.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/utils/firebase_firestore_service.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../settings_provider.dart';
import '../widgets/date_time_card.dart';
import '../widgets/event_location_card.dart';

class EventDetailsScreen extends StatelessWidget {
  EventDataModel eventDataModel;
  late settingsProvider settingProvider;

  EventDetailsScreen({super.key, required this.eventDataModel});

  @override
  Widget build(BuildContext context) {
    settingProvider = Provider.of(context);
    return Consumer<settingsProvider>(
      builder: (context,provider,child) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.purple,
        title: Text("Event Details",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: AppColors.purple
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, Routes.addEvent);
          }, icon: Icon(Icons.edit)),
          IconButton(
              onPressed: ()async {
               await FirebaseFireStoreService.deleteEvent(eventDataModel);
               //Navigator.pop(context);
               Navigator.pop(context);
              }, icon: Icon(Icons.delete, color: Colors.red,))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 138 / 78,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(eventDataModel.eventImage,
                    height: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(eventDataModel.eventTitle,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.purple
                ),
              ),
              SizedBox(height: 10.h,),
              DateTimeCard(
                date:eventDataModel.eventDate,
              ),
              SizedBox(height: 16.h,),
              EventLocationCard(),
              SizedBox(height: 16.h,),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.purple
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: GoogleMap(initialCameraPosition: provider.cameraPosition,
                    ///mapType feature here
                    mapType: MapType.normal,
                    onMapCreated: (mapController){
                      provider.mapController = mapController;
                    },
                    scrollGesturesEnabled: false,
                    tiltGesturesEnabled: false,
                    zoomGesturesEnabled: false,
                    markers: provider.markers,
                  ),
                ),
              ),
              SizedBox(height: 16.h,),
              Text("description",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.purple
              ),
              ),
              SizedBox(height: 8.h,),
              Text(eventDataModel.eventDescription,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              )
            ],
          ),
        ],
      ),
    )
    );
  }
}
