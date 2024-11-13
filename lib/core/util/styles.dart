import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/constants.dart';

abstract class Styles {
  static final textStyle24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
    color: kSecondaryColor,
  );
  static final textStyle14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Cairo',
  );
  static final textStyle16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
    color: Colors.white,
  );
  static final textStyle12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Cairo',
    color: const Color(0xffB4B4B4),
  );
  static final textStyle18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Cairo',
    color: const Color(0xff00818A),
  );
  static final textStyle10 = TextStyle(
      fontSize: 10.sp,
      color: Colors.white,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w400);
}
