import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/constants/icons.dart';
import 'package:flutter_driver_assistance/screens/create_event/create_event_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class PickLocationScreen extends StatelessWidget {
  final controller = Get.find<CreateEventController>();

  PickLocationScreen({super.key});

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
        body: OpenStreetMapSearchAndPick(
          center: LatLong(45.2862381, 18.4067281),
          onPicked: controller.pickLocation,
          buttonColor: context.theme.colorScheme.primary,
          locationPinIconColor: context.theme.colorScheme.primary,
          buttonText: 'Save location',
          onGetCurrentLocationPressed: () => controller.getCurrentLocation(),
        ),
      );
}
