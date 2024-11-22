import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/widgets/app_cache_image.dart';
import '../../../core/constants.dart';
import '../../../core/util/styles.dart';

class OrderPrice extends StatelessWidget {
  final List orderDetails;
  const OrderPrice({
    super.key,
    required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>  SizedBox(height: 10.h),
      itemCount: orderDetails.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: AppCachedImage(
                    image: orderDetails[index]["service_image"],
                    height: 80.h,
                    width: 80.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderDetails[index]["service_title"],
                      style: Styles.textStyle14.copyWith(color: kButtonColor),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      orderDetails[index]["provider_name"],
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
                      'الكمية : ${orderDetails[index]["count"]}',
                      style: Styles.textStyle12,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      '${orderDetails[index]["total_with_value"]} ر.س',
                      style: Styles.textStyle14.copyWith(color: kButtonColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
