import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/models/event_type.dart';
import 'package:flutter_driver_assistance/pages.dart';
import 'package:flutter_driver_assistance/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/text_styles.dart';
import 'create_event_controller.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  late CreateEventController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(CreateEventController());
  }

  @override
  void dispose() {
    Get.delete<CreateEventController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(
              'addEvent'.tr,
              style: DATextStyles.h6,
            ),

            /// Space
            SizedBox(height: 30.h),

            Expanded(
              child: Column(
                children: [
                  /// Event type
                  DropdownButtonFormField(
                    items: [
                      for (var e in controller.eventTypes)
                        DropdownMenuItem(
                          value: e.id,
                          child: Text(e.id.replaceAll('_', ' ')),
                        )
                    ],
                    isDense: true,
                    onChanged: (value) => controller
                      ..eventType = EventType(id: value!)
                      ..validateFields(),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text('eventType'.tr),
                      errorText:
                          controller.errorEventType ? 'required'.tr : null,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// Latitude
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text('latitude'.tr),
                      errorText:
                          controller.errorLatitude ? 'required'.tr : null,
                    ),
                    controller: controller.latField,
                    onSubmitted: (value) => controller
                      ..latitude = double.tryParse(value) ?? 0
                      ..validateFields(),
                  ),

                  SizedBox(height: 20.h),

                  /// Longitude
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text('longitude'.tr),
                      errorText:
                          controller.errorLongitude ? 'required'.tr : null,
                    ),
                    controller: controller.longField,
                    onSubmitted: (value) => controller
                      ..longitude = double.tryParse(value) ?? 0
                      ..validateFields(),
                  ),

                  SizedBox(height: 20.h),

                  GestureDetector(
                    onTap: () => Get.toNamed(DARoutes.pickLocationScreen),
                    child: Text(
                      'pickLocation'.tr,
                      style: DATextStyles.body1
                          .copyWith(color: context.theme.colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),

            /// Create button
            PrimaryButton(
              text: 'createButton'.tr,
              enabled: controller.validated,
              onPressed: controller.createEvent,
            ),
          ],
        ),
      );
}
