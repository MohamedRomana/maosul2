import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants.dart';
import '../../../core/util/styles.dart';
import '../../../generated/locale_keys.g.dart';

class OrderNoteContainer extends StatelessWidget {
  final Map orderDetails;
  const OrderNoteContainer({
    super.key, required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Center(
        child: Container(
          height: 196.h,
          width: 343.w,
          decoration: BoxDecoration(
            color: kFourthColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.order_details.tr(),
                  style: Styles.textStyle18.copyWith(color: kButtonColor),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                 orderDetails['desc'],
                  style: Styles.textStyle14.copyWith(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
