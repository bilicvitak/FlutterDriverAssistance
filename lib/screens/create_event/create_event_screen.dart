import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/models/event_type.dart';
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
                    onChanged: (value) =>
                        controller.eventType = EventType(id: value!),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text('eventType'.tr),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// Latitude
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text('latitude'.tr),
                    ),
                    controller: controller.latField,
                    onChanged: (value) =>
                        controller.latitude = double.tryParse(value) ?? 0,
                  ),

                  SizedBox(height: 20.h),

                  /// Longitude
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text('longitude'.tr),
                    ),
                    controller: controller.longField,
                    onChanged: (value) =>
                        controller.longitude = double.tryParse(value) ?? 0,
                  ),

                  SizedBox(height: 20.h),

                  GestureDetector(
                    child: Text(
                      'Pick a location on a map',
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
              onPressed: controller.createEvent,
            ),
          ],
        ),
      );
}
