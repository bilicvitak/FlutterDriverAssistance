import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../screens/main/main_controller.dart';

class CustomNavigationBar extends StatelessWidget {
  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) => Obx(
        () => NavigationBar(
          selectedIndex: mainController.selectedIndex,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          height: 80.h,
          onDestinationSelected: (index) =>
              mainController.selectedIndex = index,
          destinations: [
            /// traffic events
            NavigationDestination(
              icon: const Icon(
                Icons.traffic_outlined,
              ),
              label: 'trafficEvents'.tr,
            ),

            /// create new event
            NavigationDestination(
              icon: const Icon(
                Icons.add_road_outlined,
              ),
              label: 'addEvent'.tr,
            ),
          ],
        ),
      );
}
