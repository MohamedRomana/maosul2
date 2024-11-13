import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/constants.dart';
import '../util/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final double? horizontal;
  final double? vertical;
  final Color? fillColor;
  final Color? enabledColor;
  final Color? focusedColor;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final int? maxLines;
  final InputBorder? disabledBorder;
  final bool? enabled;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.keyboardType,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction,
    this.horizontal,
    this.vertical,
    this.fillColor,
    this.enabledColor,
    this.focusedColor,
    this.contentPadding,
    this.borderRadius,
    this.maxLines,
    this.disabledBorder,
    this.enabled,
    this.onChanged,
    this.controller,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 33.w,
        vertical: vertical ?? 0.h,
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        onTap: onTap,
        onChanged: onChanged,
        enabled: enabled,
        maxLines: maxLines ?? 1,
        cursorColor: Colors.black,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction ?? TextInputAction.next,
        decoration: InputDecoration(
          fillColor: fillColor ?? Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: hintStyle ?? Styles.textStyle12,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconColor: kButtonColor,
          contentPadding: contentPadding,
          disabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(100.r),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(100.r),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: enabledColor ?? Colors.white),
            borderRadius: borderRadius ?? BorderRadius.circular(100.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedColor ?? Colors.white),
            borderRadius: borderRadius ?? BorderRadius.circular(100.r),
          ),
        ),
      ),
    );
  }
}
