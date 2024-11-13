import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/app_router.dart';
import '../../../../core/util/styles.dart';

class CopmeletedOrderListView extends StatelessWidget {
  const CopmeletedOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        itemCount: 2,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 10.h),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () =>
                GoRouter.of(context).push(AppRouters.kOrderDetailsView),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 100.h,
              width: 343.w,
              decoration: BoxDecoration(
                color: kFourthColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        'assets/images/80457190_108935280613064_8986674267458371584_n.jpg',
                        height: 80.h,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'رقم الطلب: 25423',
                          style:
                              Styles.textStyle14.copyWith(color: kButtonColor),
                        ),
                        Text(
                          'حالة الطلب: جاري العمل عليه',
                          style: Styles.textStyle14,
                        ),
                        Text(
                          'اسم المتجر',
                          style:
                              Styles.textStyle10.copyWith(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
