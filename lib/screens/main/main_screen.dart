import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/constants/colors.dart';
import 'package:flutter_driver_assistance/screens/create_event/create_event_screen.dart';
import 'package:flutter_driver_assistance/screens/events/events_screen.dart';
import 'package:flutter_driver_assistance/screens/main/main_controller.dart';
import 'package:flutter_driver_assistance/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/icons.dart';

class MainScreen extends StatelessWidget {
  final mainController = Get.find<MainController>();

  final _screens = <Widget>[
    EventsScreen(),
    CreateEventScreen(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: DAColors.white,
          shadowColor: DAColors.border,
          elevation: 1,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: SvgPicture.asset(
            DAIcons.daLogo,
            height: 25.h,
          ),
        ),
        body: Obx(
          () => Container(
            child: _screens.elementAt(mainController.selectedIndex),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.r),
          child: Container(
            margin: EdgeInsets.only(bottom: 8.h),
            child: CustomBottomNavBar(),
          ),
        ),
      );
}
