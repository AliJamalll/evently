import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/features/Home/ui/home_screen.dart';
import 'package:evently/features/love_page/ui/love_screen.dart';
import 'package:evently/features/map_page/ui/map_screen.dart';
import 'package:evently/features/profile_page/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../core/routing/page_route_name.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {

  List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    LoveScreen(),
    ProfileScreen()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircleAvatar(
        backgroundColor: AppColors.white,
          radius: 30,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.addEvent);
          },
          child: CircleAvatar(
            backgroundColor: AppColors.purple,
              radius: 26,
            child: Icon(Icons.add,
            color: AppColors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.purple,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? ImageIcon(
                      AssetImage(
                        appAssets.homeIcon,
                      ),
                      color: Colors.white,
                    )
                  : ImageIcon(
                      AssetImage(
                        appAssets.unselectedHomeIcon,
                      ),
                      color: Colors.white,
                    ),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
                icon: selectedIndex == 1
                    ? ImageIcon(
                        AssetImage(appAssets.mapIcon),
                      )
                    : ImageIcon(
                        AssetImage(
                          appAssets.unselectedMapIcon,
                        ),
                        color: Colors.white,
                      ),
                label:  AppLocalizations.of(context)!.map),
            BottomNavigationBarItem(
                icon: selectedIndex == 2
                    ? ImageIcon(
                        AssetImage(appAssets.loveIcon),
                      )
                    : ImageIcon(
                        AssetImage(
                          appAssets.unselectedLoveIcon,
                        ),
                        color: Colors.white,
                      ),
                label:  AppLocalizations.of(context)!.favorite),
            BottomNavigationBarItem(
                icon: selectedIndex == 3
                    ? ImageIcon(
                        AssetImage(appAssets.personIcon),
                      )
                    : ImageIcon(
                        AssetImage(
                          appAssets.unselectedPersonIcon,
                        ),
                        color: Colors.white,
                      ),
                label:  AppLocalizations.of(context)!.profile)
          ]),
    );
  }
}
