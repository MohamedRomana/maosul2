import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants.dart';
import '../../../core/util/app_router.dart';
import '../../../core/util/styles.dart';

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 216.h,
        width: 343.w,
        decoration: BoxDecoration(
          color: kFourthColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Icon(
                    Icons.account_circle,
                    color: kButtonColor,
                    size: 25.sp,
                  ),
                ),
                Text(
                  'اسم المتجر',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Divider(
              color: kThirdColor,
              thickness: 1.h,
              indent: 16.w,
              endIndent: 16.w,
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouters.kLocationView);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Icon(
                      Icons.edit_location,
                      color: kButtonColor,
                      size: 25.sp,
                    ),
                  ),
                  Text(
                    'الرياض  - المملكة العربية السعودية',
                    style: Styles.textStyle16.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: kThirdColor,
              thickness: 1.h,
              indent: 16.w,
              endIndent: 16.w,
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouters.kLocationView);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Icon(
                      Icons.edit_location,
                      color: kButtonColor,
                      size: 25.sp,
                    ),
                  ),
                  Text(
                    'يبعد عنك 12 كم',
                    style: Styles.textStyle16.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: kThirdColor,
              thickness: 1.h,
              indent: 16.w,
              endIndent: 16.w,
            ),
            Row(
              children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child:
                        SvgPicture.asset('assets/svg/ic_euro_symbol_24px.svg')),
                Text(
                  'تكلفة التوصيل  : 20 ريال',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
