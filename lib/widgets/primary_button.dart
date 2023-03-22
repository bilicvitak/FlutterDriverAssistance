import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final Function() onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 55.h,
        child: TextButton(
          onPressed: enabled ? onPressed : null,
          style: TextButton.styleFrom(
            foregroundColor:
                enabled ? Colors.white : Colors.white.withOpacity(0.4),
            backgroundColor: enabled
                ? context.theme.colorScheme.primary
                : context.theme.colorScheme.primary.withOpacity(0.4),
            shape: const RoundedRectangleBorder(),
            textStyle: DATextStyles.button,
          ),
          child: Text(text),
        ),
      );
}
