import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/utils/firebase_firestore_service.dart';
import 'package:evently/core/widgets/custom_filed_button.dart';
import 'package:evently/core/widgets/custom_snack_bar.dart';
import 'package:evently/core/widgets/custom_text_field.dart';
import 'package:evently/features/create_new_event/ui/widgets/tap_item.dart';
import 'package:evently/models/event_category_model.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/custom_outlined_button.dart';

class CreateNewEventScreen extends StatefulWidget {
  const CreateNewEventScreen({super.key});

  @override
  State<CreateNewEventScreen> createState() => _CreateNewEventScreenState();
}

class _CreateNewEventScreenState extends State<CreateNewEventScreen> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  DateTime? selectedDate;

  int selectedTap = 0;
  List<eventCategoryModel> eventCatyModel = <eventCategoryModel>[
    eventCategoryModel(
        eventCatName: "Book Club",
        eventCatImg: appAssets.bookClub,
        eventCatIcon: Icons.menu_book_outlined),
    eventCategoryModel(
        eventCatName: "Sport",
        eventCatImg: appAssets.sport,
        eventCatIcon: Icons.sports_gymnastics_outlined),
    eventCategoryModel(
        eventCatName: "Birthday",
        eventCatImg: appAssets.birthday,
        eventCatIcon: Icons.local_fire_department),
    eventCategoryModel(
        eventCatName: "Eating",
        eventCatImg: appAssets.eating,
        eventCatIcon: Icons.fastfood),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.purple),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Create Event",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.purple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage(
                              eventCatyModel[selectedTap].eventCatImg),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 12.h,
                ),
                DefaultTabController(
                    length: eventCatyModel.length,
                    child: TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                        ),
                        tabAlignment: TabAlignment.start,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        onTap: (index) {
                          setState(() {
                            selectedTap = index;
                          });
                        },
                        tabs: eventCatyModel.map((item) {
                          return TapItem(eventModel: item,
                            isSelected: selectedTap ==
                                eventCatyModel.indexOf(item),);
                        }).toList()
                    )
                ),
                SizedBox(
                  height: 16.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Title",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextField(
                  controller: _titleController,
                  borderColor: AppColors.grey,
                  hint: "Event Title",
                  PrifixIcon: Icon(Icons.menu_book),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Description",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextField(
                  controller: _descController,
                  borderColor: AppColors.grey,
                  hint: "Event Description",
                  PrifixIcon: Icon(Icons.menu_book),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month,),
                    SizedBox(width: 10.w,),
                    Text("Event Date",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    TextButton(onPressed: () {
                      choseEventDate();
                    },
                        child: Text(
                          selectedDate == null ? "Choose Date" : DateFormat("dd MMM yyy").format(selectedDate!),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.purple
                          ),
                        )
                    ),

                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time,),
                    SizedBox(width: 10.w,),
                    Text("Event Time",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    TextButton(onPressed: () {},
                        child: Text("Choose Time",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.purple
                          ),
                        )
                    ),

                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Location",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomFilledButton(
                  priffexIcon: Icons.my_location,
                  suffixIcon: Icons.arrow_forward_ios,
                  text: 'Choose Event Location',
                  onPressed: () {},),
                SizedBox(
                  height: 16.h,
                ),
                CustomButton(
                  text: "Add Event",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (selectedDate != null) {
                        var data = EventDataModel(
                          eventTitle: _titleController.text,
                          eventImage:  eventCatyModel[selectedTap].eventCatImg,
                          eventDescription: _descController.text,
                          eventCategory: eventCatyModel[selectedTap].eventCatName,
                          eventDate: selectedDate!,
                        );
                        EasyLoading.show();
                        FirebaseFireStoreService.createNewEvent(data).then(
                            (value){
                              EasyLoading.dismiss();
                              if(value){
                               ShowSnackBar("event created successfully", context);
                                Navigator.pop(context);
                              }else{
                                ShowSnackBar("select date first", context);
                              }
                            }
                        );
                      }
                    }
                  },
                  buttonColor: AppColors.purple,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void choseEventDate() async {
    DateTime? currentDate = await showDatePicker(context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now()
            .add(Duration(days: 365)
        )
    );
    setState(() {
    selectedDate = currentDate;
    });
  }
}
