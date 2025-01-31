import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/features/Home/ui/widgets/custom_event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool  changeLanguage = true;
  bool darkTheme = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
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
                          )
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
                              darkTheme?Icons.sunny:Icons.dark_mode,
                              color: AppColors.white,
                              size: 30,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                changeLanguage = !changeLanguage;
                              });
                            },
                            child: Container(
                              height: 33.h,
                              width: 35.w,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  changeLanguage ? "En":"Ar",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.purple
                                ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){
                    return CustomListViwEvents();
                    },
                  separatorBuilder: (context,index) => SizedBox(height: 10.h,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

