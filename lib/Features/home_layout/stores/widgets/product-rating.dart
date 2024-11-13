import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants.dart';
import '../../../../core/util/styles.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: kButtonColor,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: Color(0xffF9BF00),
            size: 20.5,
          ),
          SizedBox(width: 2.5.w),
          Text(
            '3.9',
            style: Styles.textStyle12.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
