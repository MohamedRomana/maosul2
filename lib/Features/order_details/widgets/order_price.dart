import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import '../../../core/util/styles.dart';

class OrderPrice extends StatelessWidget {
  const OrderPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: kFourthColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 80.h,
            child: CircleAvatar(
              radius: 50.r,
              backgroundImage: const AssetImage('assets/images/images.jpeg'),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 12.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اسم المنتج',
                  style: Styles.textStyle14.copyWith(color: kButtonColor),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'اسم المتجر',
                  style: Styles.textStyle10.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 87.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الكمية : 12',
                  style: Styles.textStyle12,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '‏250.00 ر.س',
                  style: Styles.textStyle14.copyWith(color: kButtonColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
