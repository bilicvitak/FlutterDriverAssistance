import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/screens/create_event/create_event_screen.dart';
import 'package:flutter_driver_assistance/screens/events/events_screen.dart';
import 'package:flutter_driver_assistance/screens/main/main_controller.dart';
import 'package:flutter_driver_assistance/widgets/custom_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/icons.dart';

class MainScreen extends StatelessWidget {
  final mainController = Get.find<MainController>();

  final _screens = const <Widget>[
    EventsScreen(),
    CreateEventScreen(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          shadowColor: Colors.grey.shade200,
          elevation: 1,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: SvgPicture.asset(
            DAIcons.daLogo,
            height: 25.h,
          ),
        ),
        body: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Container(
              child: _screens.elementAt(mainController.selectedIndex),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: CustomNavigationBar(),
        ),
      );
}
