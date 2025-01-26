import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/routing/page_route_name.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'custom_containr.dart';

class CustomWidgets extends StatefulWidget {
  const CustomWidgets({super.key});

  @override
  State<CustomWidgets> createState() => _CustomWidgetsState();
}

class _CustomWidgetsState extends State<CustomWidgets> {
  List<String> images = [
    appAssets.onboarding3,
    appAssets.onboarding4,
    appAssets.onboarding5
  ];

  List<String> titles = [
    "Find Events That Inspire You",
    "Effortless Event Planning",
    "Connect with Friends & Share Moments"
  ];

  List<String> desc = [
    """Dive into a world of events crafted to fit your\nunique interests. Whether you're into live\nmusic,art workshops, professional networking,\nor simply discovering new experiences, we\nhave something for everyone. Our curated\nrecommendations will help you explore,\nconnect, and make the most of every\nopportunity around you.
    """,
    """Take the hassle out of organizing events with\nour all-in-one planning tools. From setting up\ninvites and managing RSVPs to scheduling\nreminders and coordinating details, we’ve got\nyou covered. Plan with ease and focus on what\nmatters – creating an unforgettable experience\nfor you and your guests.
    """,
    """Make every event memorable by sharing the\nexperience with others. Our platform lets you\ninvite friends,keep everyone in the loop, and\ncelebrate moments together. Capture and share the excitement with your network, so\nyou can relive the highlights and cherish the memories.
    """
  ];
  PageController controller = PageController(initialPage: 0);

  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: controller,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return CustomOnBoarding(
                    image: images[index],
                    title: titles[index],
                    desc: desc[index],
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left arrow button (only visible if selectedIndex > 0)
              if (selectedIndex > 0)
                IconButton(
                  onPressed: () {
                    if (selectedIndex > 0) {
                      controller.animateToPage(
                        selectedIndex - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 30,
                    color: AppColors.purple,
                  ),
                ),
              Spacer(),
              // Smooth page indicator
              SmoothPageIndicator(
                controller: controller,
                count: images.length,
                effect: SwapEffect(
                  dotColor: Colors.grey,
                  activeDotColor: AppColors.purple,
                ),
              ),
              Spacer(),
              // Right arrow button or "Start" button
              if (selectedIndex < images.length - 1)
                IconButton(
                  onPressed: () {
                    if (selectedIndex < images.length - 1) {
                      controller.animateToPage(
                        selectedIndex + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                    color: AppColors.purple,
                  ),
                )
              else
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signin);
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.purple,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}

