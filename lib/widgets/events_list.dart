import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/constants/text_styles.dart';
import 'package:flutter_driver_assistance/widgets/event_list_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EventsList extends StatelessWidget {
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
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: EventListTile(),
          ),
        )
      ],
    ),
  );
}
