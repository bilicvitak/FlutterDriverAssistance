import 'package:flutter/material.dart';
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
  late CreateEventController createEventController;

  @override
  void initState() {
    super.initState();
    createEventController = Get.put(CreateEventController());
  }

  @override
  void dispose() {
    Get.delete<CreateEventController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
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
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(value: 'da', child: Text('da')),
                    DropdownMenuItem(value: 'ne', child: Text('ne')),
                  ],
                  isDense: true,
                  onChanged: (value) => print(value),
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
                ),

                SizedBox(height: 20.h),

                /// Longitude
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: Text('longitude'.tr),
                  ),
                ),
              ],
            ),
          ),

          /// Create button
          PrimaryButton(
            text: 'createButton'.tr,
            onPressed: () {},
          ),
        ],
      );
}
