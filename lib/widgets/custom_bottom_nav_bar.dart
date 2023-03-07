import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/constants/colors.dart';
import 'package:flutter_driver_assistance/constants/text_styles.dart';
import 'package:flutter_driver_assistance/screens/main/main_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) => Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            /// traffic events
            BottomNavigationBarItem(
              icon: Icon(
                Icons.traffic_outlined,
                color: DAColors.onPrimary,
              ),
              activeIcon: Icon(
                Icons.traffic_outlined,
                color: DAColors.primary,
              ),
              label: 'Traffic events',
            ),

            /// create new event
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_road_outlined,
                color: DAColors.onPrimary,
              ),
              activeIcon: Icon(
                Icons.add_road_outlined,
                color: DAColors.primary,
              ),
              label: 'Add event',
            ),
          ],
          iconSize: 24.h,
          elevation: 0,
          selectedLabelStyle: DATextStyles.body,
          unselectedLabelStyle: DATextStyles.body,
          selectedItemColor: DAColors.primary,
          unselectedItemColor: DAColors.onPrimary,
          currentIndex: mainController.selectedIndex,
          onTap: (index) => mainController.selectedIndex = index,
          backgroundColor: DAColors.white,
        ),
      );
}
