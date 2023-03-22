import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
/// Class which will trigger various snackbars
/// Can be used throughout the app with `DASnackbars.showSomeSnackbar`
///

class DASnackbars {
  /// Snackbar shown if some success happens
  static void showSuccessSnackbar({
    required String message,
    Color backgroundColor = Colors.green,
    IconData icon = Icons.check,
  }) =>
      Get.rawSnackbar(
        backgroundColor: backgroundColor,
        icon: Icon(
          icon,
          color: Colors.blue,
        ),
        message: message,
        margin: EdgeInsets.all(32.r),
        padding: EdgeInsets.all(24.r),
        borderRadius: 16.r,
      );

  /// Snackbar shown if some error happens
  static void showErrorSnackbar({
    required String message,
    Color backgroundColor = const Color(0xFFBA1A1A),
    IconData icon = Icons.close,
  }) =>
      Get.rawSnackbar(
        backgroundColor: backgroundColor,
        icon: Icon(
          icon,
          color: Colors.blue,
        ),
        message: message,
        margin: EdgeInsets.all(32.r),
        padding: EdgeInsets.all(24.r),
        borderRadius: 16.r,
      );
}
