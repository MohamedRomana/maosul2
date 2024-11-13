import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/util/styles.dart';

enum FlashMessageType {
  success,
  error,
  warning,
  info,
}

Color chooseFlashBckColor(FlashMessageType type) {
  Color color;
  switch (type) {
    case FlashMessageType.success:
      color = Colors.green;
      break;
    case FlashMessageType.error:
      color = Colors.red;
      break;
    case FlashMessageType.warning:
      color = Colors.amber;
      break;
    case FlashMessageType.info:
      color = const Color(0xff3661D9);
      break;
  }

  return color;
}

void showFlashMessage({
  required String message,
  required FlashMessageType type,
  required BuildContext context,
  Color? textColor,
  FlashPosition position = FlashPosition.top,
}) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 3),
    builder: (context, controller) {
      return Flash(
        controller: controller,
        child: FlashBar(
          controller: controller,
          backgroundColor: chooseFlashBckColor(type),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(12.r),
              bottomStart: Radius.circular(12.r),
            ),
          ),
          behavior: FlashBehavior.fixed,
          position: position,
          showProgressIndicator: false,
          shadowColor: Colors.black38,
          primaryAction: null,
          content: Text(
            message,
            style: Styles.textStyle16.copyWith(
              color: textColor ?? Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}
