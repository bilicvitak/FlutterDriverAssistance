import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 55.h,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: context.theme.colorScheme.primary,
            shape: const RoundedRectangleBorder(),
            textStyle: DATextStyles.button,
          ),
          child: Text(text),
        ),
      );
}
