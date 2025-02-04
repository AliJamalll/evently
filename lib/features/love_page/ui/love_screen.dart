import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/widgets/custom_text_field.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/firebase_firestore_service.dart';
import '../../Home/ui/widgets/custom_event_card.dart';

class LoveScreen extends StatelessWidget {
   LoveScreen({super.key, this.eventDataModel});
  EventDataModel? eventDataModel;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
                StreamBuilder(
                    stream: FirebaseFireStoreService.getStreamFavoriteDataFromFireStore(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(
                          color: AppColors.purple,
                        );
                      }
                      List<EventDataModel> eventDataModel =
                      snapshot.data!.docs.map((e) {
                        return e.data();
                      }).toList();
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: height.h,
                          child: eventDataModel.isEmpty
                              ? Text("No Events Created yet")
                              : ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: eventDataModel.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return CustomListViwEvents(
                                eventDataModel: eventDataModel[index],
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      )
    );
  }
}
