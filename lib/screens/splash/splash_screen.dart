import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/icons.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            /// First Red Container
            Container(
              color: DAColors.primary,
            ),

            /// White Container
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInCubic,
                bottom: splashController.whiteContainerHeight,
                child: Container(
                  color: DAColors.white,
                  height: Get.height,
                  width: Get.width,
                ),
              ),
            ),

            /// Logo
            Center(
              child: Obx(
                () => AnimatedOpacity(
                  opacity: splashController.logoOpacity,
                  duration: const Duration(seconds: 1),
                  child: Obx(
                    () => AnimatedSlide(
                      offset: Offset(splashController.textSlide, 0),
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease,
                      child: SvgPicture.asset(
                        DAIcons.daLogo,
                        height: 39.h,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// Last Red Container
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInCubic,
                bottom: splashController.redContainerHeight,
                child: Container(
                  color: DAColors.primary,
                  height: Get.height,
                  width: Get.width,
                ),
              ),
            ),
          ],
        ),
      );
}
