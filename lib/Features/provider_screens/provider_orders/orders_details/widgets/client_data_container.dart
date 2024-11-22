import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/location/location.dart';
import '../../../../../core/util/styles.dart';

class ClientDataContainer extends StatelessWidget {
  final Map providerData;
  const ClientDataContainer({
    super.key, required this.providerData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.customer_data.tr(),
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
                        'اسم الزبون: ${providerData['user_name']}',
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
                        isScrollControlled: true,
                        enableDrag: false,
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
                          'مكان التوصيل : ${providerData['user_address']}',
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
                          'وقت التوصيل : ${providerData['order_time']}',
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
                        'رقم الطلب : ${providerData['id']}',
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
