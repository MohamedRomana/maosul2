import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/util/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final TextStyle? style;
  final Widget? child;
  final Size? minimumSize;
  final Color? backgroundColor;
  final OutlinedBorder? shape;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.text,
    this.style,
    this.child,
    this.minimumSize,
    this.backgroundColor,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? kButtonColor,
        minimumSize: minimumSize ?? Size(311.w, 48.h),
        shape: shape,
      ),
      child: child ??
          Text(
            text!,
            style: style ?? Styles.textStyle16,
          ),
    );
  }
}
