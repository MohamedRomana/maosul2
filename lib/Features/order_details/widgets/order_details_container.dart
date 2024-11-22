import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maosul2/core/location/location.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import '../../../core/constants.dart';
import '../../../core/util/styles.dart';

class OrderDetailsContainer extends StatelessWidget {
  final Map orderDetails;
  const OrderDetailsContainer({
    super.key, required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h),
      child: Center(
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
                    orderDetails['provider_name'],
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
                  AppRouter.navigateTo(context, const Location());
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
                     orderDetails["provider_country"],
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
                  AppRouter.navigateTo(context, const Location());
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
                      'يبعد عنك ${orderDetails["provider_distance"]} كم',
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
                    'تكلفة التوصيل  : ${orderDetails["delivery"]} ريال',
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
      ),
    );
  }
}
