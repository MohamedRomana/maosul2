import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/styles.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 580.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: kFourthColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
          child: Text(
        'السله فارغه',
        style: Styles.textStyle24.copyWith(color: Colors.grey),
      )),
    );
  }
}
