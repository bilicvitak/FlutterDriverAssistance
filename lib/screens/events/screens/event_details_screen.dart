import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/constants/icons.dart';
import 'package:flutter_driver_assistance/constants/text_styles.dart';
import 'package:flutter_driver_assistance/screens/events/events_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventDetailsScreen extends StatelessWidget {
  final controller = Get.find<EventsController>();

  EventDetailsScreen({super.key});

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
            DAIcons.logoText,
            height: 25.h,
          ),
          leading: CloseButton(
            color: context.theme.colorScheme.primary,
            onPressed: Get.back,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Event details',
                style: DATextStyles.h6,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Event type',
                style: DATextStyles.subtitle2,
              ),
              Text(
                controller.events[controller.selectedIndex].eventType,
                style: DATextStyles.body1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Latitude',
                style: DATextStyles.subtitle2,
              ),
              Text(
                controller.events[controller.selectedIndex].latitude.toString(),
                style: DATextStyles.body1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Longitude',
                style: DATextStyles.subtitle2,
              ),
              Text(
                controller.events[controller.selectedIndex].longitude
                    .toString(),
                style: DATextStyles.body1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Created',
                style: DATextStyles.subtitle2,
              ),
              Text(
                DateFormat('dd.MM.yyyy HH:mm:ss').format(
                    controller.events[controller.selectedIndex].created),
                style: DATextStyles.body1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Modified',
                style: DATextStyles.subtitle2,
              ),
              Text(
                DateFormat('dd.MM.yyyy HH:mm:ss').format(
                    controller.events[controller.selectedIndex].modified ??
                        controller.events[controller.selectedIndex].created),
                style: DATextStyles.body1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Active',
                style: DATextStyles.subtitle2,
              ),
              Text(
                controller.events[controller.selectedIndex].active.toString(),
                style: DATextStyles.body1,
              ),
            ],
          ),
        ),
      );
}
