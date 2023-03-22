import 'package:flutter/material.dart';
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
              color: context.theme.colorScheme.primary,
            ),

            /// White Container
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInCubic,
                bottom: splashController.whiteContainerHeight,
                child: Container(
                  color: Colors.white,
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
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.ease,
                      child: SvgPicture.asset(
                        DAIcons.logoText,
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
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInCubic,
                top: splashController.redContainerHeight,
                child: Container(
                  color: context.theme.colorScheme.primary,
                  height: Get.height,
                  width: Get.width,
                ),
              ),
            ),
          ],
        ),
      );
}
