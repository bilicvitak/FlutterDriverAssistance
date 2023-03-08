import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/color_schemes.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EventListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const ListTile(
        title: Text('Event Type'),
        subtitle: Text('01.01.2023. 14:30'),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      );
}
