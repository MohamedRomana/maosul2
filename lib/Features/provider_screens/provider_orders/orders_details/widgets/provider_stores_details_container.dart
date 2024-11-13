import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maosul2/core/location/location.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/util/styles.dart';

class ProviderStoresDetailsContainer extends StatelessWidget {
  const ProviderStoresDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.store_data.tr(),
            style: Styles.textStyle18.copyWith(color: kButtonColor),
          ),
          SizedBox(
            height: 11.h,
          ),
          Container(
            height: 216.h,
            width: 343.w,
            decoration: BoxDecoration(
              color: kFourthColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: kButtonColor,
                        size: 25.sp,
                      ),
                      SizedBox(width: 11.w),
                      Text(
                        'اسم المتجر',
                        style: Styles.textStyle16.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: kThirdColor,
                    endIndent: 30.w,
                    indent: 30.w,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        enableDrag: false,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SizedBox(
                              height: 600.h, child: const Location());
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit_location,
                            color: kButtonColor, size: 25.sp),
                        SizedBox(width: 11.w),
                        Text(
                          'الرياض  - المملكة العربية السعودية',
                          style: Styles.textStyle16.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: kThirdColor,
                    endIndent: 30.w,
                    indent: 30.w,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        enableDrag: false,
                        
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SizedBox(
                              height: 600.h, child: const Location());
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit_location,
                            color: kButtonColor, size: 25.sp),
                        SizedBox(width: 11.w),
                        Text(
                          'يبعد عنك 12 كم',
                          style: Styles.textStyle16.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: kThirdColor,
                    endIndent: 30.w,
                    indent: 30.w,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/ic_euro_symbol_24px.svg',
                        height: 20.h,
                      ),
                      SizedBox(width: 11.w),
                      Text(
                        'تكلفة التوصيل  : 20 ريال',
                        style: Styles.textStyle16.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
