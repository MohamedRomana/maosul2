import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/styles.dart';
import '../../../../generated/locale_keys.g.dart';

class TotalContainer extends StatelessWidget {
  const TotalContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 6.w, bottom: 19.h),
          child: Text(
            textAlign: TextAlign.start,
            LocaleKeys.total.tr(),
            style: Styles.textStyle14.copyWith(
              color: kButtonColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 175.h,
          width: 343.w,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 19.h, bottom: 14.h, right: 21.w, left: 15.w),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.subtotal.tr(),
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      '‏135 ر.س',
                      style: Styles.textStyle14.copyWith(color: kButtonColor),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0xff154479),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 5.h, bottom: 5.h, right: 21.w, left: 15.w),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.vat.tr(),
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      '‏25 ر.س',
                      style: Styles.textStyle14.copyWith(color: kButtonColor),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0xff154479),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 19.h, bottom: 14.h, right: 21.w, left: 15.w),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.total.tr(),
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      '‏185 ر.س',
                      style: Styles.textStyle18.copyWith(color: kButtonColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
