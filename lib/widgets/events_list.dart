import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/constants/text_styles.dart';
import 'package:flutter_driver_assistance/pages.dart';
import 'package:flutter_driver_assistance/screens/events/events_controller.dart';
import 'package:flutter_driver_assistance/widgets/event_list_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EventsList extends StatelessWidget {
  final EventsController controller;

  const EventsList({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'events'.tr,
              style: DATextStyles.h6,
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(DARoutes.eventsLocationScreen),
              child: Text(
                'pickLocation'.tr,
                style: DATextStyles.body1.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => controller.address.isNotEmpty
                  ? Column(
                      children: [
                        Text(
                          controller.address,
                          style: DATextStyles.body1,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    )
                  : Container(),
            ),
            Obx(
              () => controller.events.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: controller.events.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: GestureDetector(
                          onTap: () => controller
                            ..selectedIndex = index
                            ..goToEventDetails(),
                          child: EventListTile(event: controller.events[index]),
                        ),
                      ),
                    )
                  : const Text('No events found'),
            )
          ],
        ),
      );
}
