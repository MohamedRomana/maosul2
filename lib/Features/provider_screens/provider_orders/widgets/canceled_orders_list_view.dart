import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/app_router.dart';
import '../../../../core/util/styles.dart';

bool isExpanded = false;

class CanceledOrdersListView extends StatelessWidget {
  const CanceledOrdersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => InkWell(
                  onTap: () => GoRouter.of(context)
                      .push(AppRouters.kProviderOrdersDetails),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                    child: Container(
                      height: 122.h,
                      width: 343.w,
                      decoration: BoxDecoration(
                        color: kFourthColor,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 12.w, end: 90.w),
                                  child: Text(
                                    'اسم العميل',
                                    style: Styles.textStyle14
                                        .copyWith(color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'رقم الطلب : 25254',
                                  style: Styles.textStyle14
                                      .copyWith(color: kButtonColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.edit_location,
                                  color: kButtonColor,
                                  size: 25.sp,
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  'الرياض  - المملكة العربية السعودية',
                                  style: Styles.textStyle14
                                      .copyWith(color: Colors.grey),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/ic_history_24px.svg',
                                  height: 20.h,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 12.w, end: 120.w),
                                  child: Text(
                                    '25 دقيقة',
                                    style: Styles.textStyle14
                                        .copyWith(color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'جاري التوصيل',
                                  style: Styles.textStyle14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
        : Center(
            child: Text(
              textAlign: TextAlign.center,
              'لا توجد\n طلبات ملغية',
              maxLines: 2,
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Cairo',
                  fontSize: 44.sp,
                  fontWeight: FontWeight.w400),
            ),
          );
  }
}
