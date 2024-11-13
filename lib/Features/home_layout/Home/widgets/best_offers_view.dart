import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/constants.dart';
import '../../../../core/util/styles.dart';

class BestOffersView extends StatelessWidget {
  const BestOffersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            'assets/images/burger-with-melted-cheese.jpg',
            width: 140.w,
            height: 150.h,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 140.w,
          height: 150.h,
          decoration: BoxDecoration(
            color: kButtonColor.withOpacity(0.36),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        Positioned(
          top: 10.h,
          child: Container(
            width: 35.86.w,
            height: 21.h,
            decoration: BoxDecoration(
              color: kButtonColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.r),
                bottomLeft: Radius.circular(5.r),
              ),
            ),
            child: Center(
              child: Text(
                '50%',
                style: Styles.textStyle12.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20.h,
          right: 10.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اسم المتجر',
                style: Styles.textStyle12
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'حي الصحافة - ش الملك سعود',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
