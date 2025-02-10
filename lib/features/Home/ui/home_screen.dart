import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/utils/firebase_firestore_service.dart';
import 'package:evently/features/Home/ui/widgets/custom_event_card.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../models/event_category_model.dart';
import '../../create_new_event/ui/widgets/tap_item.dart';
import '../../settings_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool changeLanguage = true;
  bool darkTheme = false;
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
    var provider = Provider.of<settingsProvider>(context);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: height * 0.25.h,
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back ✨",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white),
                              ),
                              Text(
                                "Ali Jamal",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.white,
                                  ),
                                  Text(
                                    "Cairo , Egypt",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    darkTheme = !darkTheme;
                                  });
                                },
                                icon: Icon(
                                  darkTheme ? Icons.sunny : Icons.dark_mode,
                                  color: AppColors.white,
                                  size: 30,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (changeLanguage) {
                                    provider.setNewLanguage("en");
                                  } else {
                                    provider.setNewLanguage("ar");
                                  }
                                  setState(() {
                                    changeLanguage = !changeLanguage;
                                  });
                                },
                                child: Container(
                                  height: 33.h,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      changeLanguage ? "En" : "Ar",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.purple),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultTabController(
                        length: eventCatyModel.length,
                        child: TabBar(
                          indicatorColor: Colors.transparent,
                          isScrollable: true,
                          indicator: BoxDecoration(),
                          tabAlignment: TabAlignment.start,
                          indicatorPadding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.symmetric(horizontal: 6),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 0.h),
                          onTap: (index) {
                            setState(() {
                              selectedTap = index;
                            });
                          },
                          tabs: eventCatyModel.map((item) {
                            return TapItem2(
                              eventModel: item,
                              isSelected:
                                  selectedTap == eventCatyModel.indexOf(item),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            StreamBuilder(
                stream: FirebaseFireStoreService.getStreamDataFromFireStore(eventCatyModel[selectedTap].eventCatName),
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
    );
  }
}
