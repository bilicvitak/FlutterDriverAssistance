import 'package:flutter_driver_assistance/pages.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final _whiteContainerHeight = Get.height.obs;
  final _textSlide = (-0.15).obs;
  final _logoOpacity = 0.0.obs;
  final _redContainerHeight = Get.height.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  double get whiteContainerHeight => _whiteContainerHeight.value;

  double get textSlide => _textSlide.value;

  double get logoOpacity => _logoOpacity.value;

  double get redContainerHeight => _redContainerHeight.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set whiteContainerHeight(double value) => _whiteContainerHeight.value = value;

  set textSlide(double value) => _textSlide.value = value;

  set logoOpacity(double value) => _logoOpacity.value = value;

  set redContainerHeight(double value) => _redContainerHeight.value = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();

    await runAnimation();
    await goToApp();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<void> runAnimation() async {
    /// down drop White Container
    await Future.delayed(const Duration(seconds: 1));
    whiteContainerHeight = 0;

    /// show logo and text
    await Future.delayed(const Duration(seconds: 1));
    logoOpacity = 1;

    /// slide text
    await Future.delayed(const Duration(milliseconds: 200));
    textSlide = 0;

    /// down drop Red Container
    await Future.delayed(const Duration(milliseconds: 2500));
    redContainerHeight = 0;
  }

  Future<void> goToApp() async => await Get.offAllNamed(DARoutes.mainScreen);
  
}
